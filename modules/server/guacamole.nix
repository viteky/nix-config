{
  den.aspects.server.nixos = {
    config,
    pkgs,
    ...
  }: let
    app = "guacamole";
    guacVer = config.services.guacamole-client.package.version;
    pgsqlVer = "42.7.1";

    pgsqlDriverSrc = pkgs.fetchurl {
      url = "https://jdbc.postgresql.org/download/postgresql-${pgsqlVer}.jar";
      sha256 = "sha256-SbupwyANT2Suc5A9Vs4b0Jx0UX3+May0R0VQa0/O3lM=";
    };

    pgsqlExtension = pkgs.stdenv.mkDerivation {
      name = "guacamole-auth-jdbc-postgresql-${guacVer}";
      src = pkgs.fetchurl {
        url = "https://dlcdn.apache.org/guacamole/${guacVer}/binary/guacamole-auth-jdbc-${guacVer}.tar.gz";
        sha256 = "sha256-l7xf09Z9JcDpikddHf0wigN4WfVJ+sRxcccjt6cDk2Y=";
      };
      phases = "unpackPhase installPhase";
      unpackPhase = ''
        tar -xzf $src
      '';
      installPhase = ''
        mkdir -p $out
        cp -r guacamole-auth-jdbc-${guacVer}/postgresql/* $out
      '';
    };

    totpExtension = pkgs.stdenv.mkDerivation {
      name = "guacamole-auth-totp-${guacVer}";
      src = pkgs.fetchurl {
        url = "https://apache.org/dyn/closer.lua/guacamole/${guacVer}/binary/guacamole-auth-totp-${guacVer}.tar.gz?action=download";
        sha256 = "sha256-AgLBl9O05Z5ptN3iqAkGrfXwOkl3SLdK09WZAi4m80c=";
      };
      phases = "unpackPhase installPhase";
      unpackPhase = ''
        tar -xzf $src
      '';
      installPhase = ''
        mkdir -p $out
        cp guacamole-auth-totp-${guacVer}/guacamole-auth-totp-${guacVer}.jar $out
      '';
    };

    psql = "${pkgs.postgresql}/bin/psql";
    cat = "${pkgs.coreutils-full}/bin/cat";
  in {
    services = {
      guacamole-server = {
        enable = true;
      };

      guacamole-client = {
        enable = true;
        settings = {
          postgresql-hostname = "127.0.0.1";
          postgresql-database = app;
          postgresql-username = app;
          postgresql-password = "";
        };
      };

      xrdp = {
        enable = true;
        defaultWindowManager = "xfce4-session";
        openFirewall = true;
      };

      xserver = {
        enable = true;
        desktopManager.xfce.enable = true;
      };

      tomcat.port = 8090;

      nginx.virtualHosts."remote.viteky.net" = {
        forceSSL = false;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8090/guacamole$request_uri";
          proxyWebsockets = true;
          recommendedProxySettings = true;
          extraConfig = ''
            proxy_buffering off;
          '';
        };
      };

      postgresql = {
        enable = true;
        authentication = pkgs.lib.mkOverride 10 ''
          #type database  DBuser  auth-method
          local all       all     trust
          #type database DBuser origin-address auth-method
          host  all      all    127.0.0.1/32   trust
        '';
        ensureDatabases = [
          app
        ];
        ensureUsers = [
          {
            name = app;
            ensureDBOwnership = true;
          }
        ];
      };
    };

    environment.etc = {
      "guacamole/lib/postgresql-${pgsqlVer}.jar".source = pgsqlDriverSrc;

      "guacamole/extensions/guacamole-auth-jdbc-postgresql-${guacVer}.jar".source = "${pgsqlExtension}/guacamole-auth-jdbc-postgresql-${guacVer}.jar";

      "guacamole/extensions/guacamole-auth-totp-${guacVer}.jar" = {
        enable = true;
        source = "${totpExtension}/guacamole-auth-totp-${guacVer}.jar";
      };
    };

    systemd.services = {
      tomcat = {
        requires = ["postgresql.service"];
        after = ["postgresql.service"];
      };

      guacamole-pgsql-schema-import = {
        enable = true;
        requires = ["postgresql.service"];
        after = ["postgresql.service"];
        wantedBy = ["tomcat.service" "multi-user.target"];
        script = ''
          echo "[guacamole-bootstrapper] Info: checking if database '${app}' exists but is empty..."
          output=$(${psql} -U ${app} -c "\dt" 2>&1)
          if [[ $output == "Did not find any relations." ]]; then
            echo "[guacamole-bootstrapper] Info: installing guacamole postgres database schema..."
            ${cat} ${pgsqlExtension}/schema/*.sql | ${psql} -U ${app} -d ${app} -f -
          fi
        '';
      };
    };
  };
}

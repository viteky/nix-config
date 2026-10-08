{
  den.aspects.server.nixos = {
    pkgs,
    config,
    ...
  }: {
    services.nextcloud = {
      enable = true;
      hostName = "nextcloud.viteky.net";
      config.adminuser = null;
      # config.adminpassFile = config.sops.secrets.nextcloud-admin-pass.path;
      config.dbtype = "sqlite";
      package = pkgs.nextcloud34;
      extraAppsEnable = true;
      extraApps = {
        inherit
          (config.services.nextcloud.package.packages.apps)
          news
          contacts
          calendar
          tasks
          ;
      };
      settings = {
        trusted_domains = ["nextcloud.viteky.net"];
      };
    };

    services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
      forceSSL = false;
      enableACME = true;
    };
  };
}

{
  den.aspects.desktop = {
    homeManager = {
      pkgs,
      config,
      ...
    }: let
      nixos-icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    in {
      programs.firefox = {
        enable = true;
        #configPath = "${config.xdg.configHome}/.mozilla/firefox";
        profiles.default = {
          isDefault = true;
          settings = {
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "signon.rememberSignons" = false;
            "general.autoScroll" = true;
            "sidebar.revamp.round-content-area" = true;
            "sidebar.verticalTabs" = true;
            "sidebar.revamp" = true;
            "sidebar.visibility" = "always-show";
            "extensions.autoDisableScopes" = 0;
          };
          extensions = {
            force = true;
            packages = with pkgs.nur.repos.rycee.firefox-addons; [
              bitwarden
              ublock-origin
              sponsorblock
              darkreader
              redirector
              consent-o-matic
              unpaywall
              stylus
              enhancer-for-youtube
              firefox-color
            ];
          };

          userChrome = ''
            html { min-width: 0 !important; }
          '';

          search = {
            force = true;
            engines = {
              "NixOS Packages" = {
                urls = [{template = "https://search.nixos.org/packages?channel=unstable&type=packages&query={searchTerms}";}];
                icon = nixos-icon;
                definedAliases = ["@np"];
              };

              "NixOS Options" = {
                urls = [{template = "https://search.nixos.org/options?channel=unstable&type=packages&query={searchTerms}";}];
                icon = nixos-icon;
                definedAliases = ["@no"];
              };

              "NixOS Wiki" = {
                urls = [{template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";}];
                icon = nixos-icon;
                definedAliases = ["@nw"];
              };
              "Home Manager Options" = {
                urls = [{template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master";}];
                icon = nixos-icon;
                definedAliases = ["@hm"];
              };

              "GitHub" = {
                urls = [{template = "https://github.com/search?q={searchTerms}&type=code";}];
                definedAliases = ["@gh"];
                icon = "https://github.githubassets.com/favicons/favicon.svg";
              };
            };
          };
        };
      };

      catppuccin.firefox.force = true; 
    };
  };
}

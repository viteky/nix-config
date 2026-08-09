{pkgs, ...}: {
  den.aspects.server = {
    nixos = {
      services = {
        sonarr.enable = true;
        radarr.enable = true;
        readarr.enable = true;
        lidarr.enable = true;
        bazarr.enable = true;
        prowlarr.enable = true;
        sabnzbd.enable = true;
        jellyseerr.enable = true;
        vaultwarden.enable = true;
        plex.enable = true;
        home-assistant.enable = true;
        immich.enable = true;
        jellyfin.enable = true;
        audiobookshelf.enable = true;
        services.adguardhome = {
          enable = true;
          allowDHCP = true;
          mutableSettings = true;
        };

        glance = {
          enable = true;
          openFirewall = true;
          settings = {
            server = {
              port = 5678;
              host = "0.0.0.0";
            };
          };
        };
      };

      security.acme = {
        acceptTerms = true;
        defaults.email = "jayden.vitek@gmail.com";
      };

      environment.systemPackages = with pkgs; [
        jellyfin
        jellyfin-web
        jellyfin-ffmpeg
      ];
    };
  };
}

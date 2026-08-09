{
  den.aspects.server.nixos = {pkgs, ...}: let
    package = pkgs.homepage-dashboard.overrideAttrs (oldAttrs: {
      postInstall = ''
        mkdir -p $out/share/homepage/public/images
        ln -s ${../../wallpapers/keyboards.jpg} $out/share/homepage/public/images/background.png
      '';
    });
  in {
    services.homepage-dashboard = {
      enable = true;
      inherit package;
      allowedHosts = "*";
      widgets = [
        {
          search = {
            provider = "google";
            target = "_self";
            focus = true;
            showSearchSuggestions = true;
          };
        }
        {
          resources = {
            cpu = true;
            disk = "/";
            memory = true;
          };
        }
        {
          datetime = {
            format = {
              timeStyle = "short";
              hour12 = true;
              dateStyle = "short";
              timeZone = "Australia/Sydney";
            };
          };
        }
      ];

      settings = {
        title = "My Homepage";
        theme = "dark";
        fullWidth = true;
        headerStyle = "boxed";
        target = "_self";
        hideVersion = true;
        disableUpdateCheck = true;
        bookmarksStyle = "icons";
        background = {
          image = "/images/background.png";
          blur = "sm";
          opacity = 80;
        };
      };

      services = [
        {
          "Media Management" = [
            {
              Radarr = {
                icon = "radarr";
                href = "http://radarr.viteky.net";
                description = "Movie Manager";
                widget = {
                  type = "radarr";
                  url = "http://localhost:7878";
                  key = "96024af28fb3409cbd401a31c7c85506";
                };
              };
            }
            {
              Sonarr = {
                icon = "sonarr";
                href = "http://sonarr.viteky.net";
                description = "TV Show Manager";
                widget = {
                  type = "sonarr";
                  url = "http://localhost:8989";
                  key = "19264c4b2dab4ba1b854dc53e2653354";
                };
              };
            }
            {
              Readarr = {
                icon = "readarr";
                href = "http://readarr.viteky.net";
                description = "Books Manager";
                widget = {
                  type = "readarr";
                  url = "http://localhost:8787";
                  key = "c2654a89897b4e3997203ce07c9eabb9";
                };
              };
            }
            {
              Lidarr = {
                icon = "lidarr";
                href = "http://lidarr.viteky.net";
                description = "Music Manager";
                widget = {
                  type = "lidarr";
                  url = "http://localhost:8686";
                  key = "9359d446fbb144a9a485b9c0e16536a2";
                };
              };
            }
            {
              Prowlarr = {
                icon = "prowlarr";
                href = "http://prowlarr.viteky.net";
                description = "Indexer Manager";
                widget = {
                  type = "prowlarr";
                  url = "http://localhost:9696";
                  key = "79e4f6b5c0cb4a0aa9298901696fc0ce";
                };
              };
            }
            {
              Bazarr = {
                icon = "bazarr";
                href = "http://bazarr.viteky.net";
                description = "Subtitle Manager";
                widget = {
                  type = "bazarr";
                  url = "http://localhost:6767";
                  key = "ab5383d6ddfc0955da30e67c711afac7";
                };
              };
            }
          ];
        }
        {
          "Downloaders" = [
            {
              qBittorrent = {
                icon = "qbittorrent";
                href = "http://qbittorrent.viteky.net";
                description = "Torrent Manager";
                widget = {
                  type = "qbittorrent";
                  url = "http://localhost:8081";
                  username = "jaydenv";
                  password = "TriJayCou191507";
                };
              };
            }
            {
              Sabnzbd = {
                icon = "sabnzbd";
                href = "http://sabnzbd.viteky.net";
                description = "Usenet Manager";
                widget = {
                  type = "sabnzbd";
                  url = "http://localhost:8080";
                  key = "dadd984fa8ac422481be9351c8f7e23a";
                };
              };
            }
          ];
        }
        {
          "Files" = [
            {
              "AdGuard Home" = {
                icon = "adguard-home";
                href = "http://adguard.viteky.net";
                description = "Adblocker";
              };
            }
            {
              Immich = {
                icon = "immich";
                href = "http://photos.viteky.net";
                description = "Photo Gallery";
              };
            }
            {
              NextCloud = {
                icon = "nextcloud";
                href = "http://nextcloud.viteky.net";
                description = "Cloud Drive";
              };
            }
            {
              Bitwarden = {
                icon = "bitwarden";
                href = "http://vault.viteky.net";
                description = "Password Manager";
              };
            }
            {
              Jellyfin = {
                icon = "jellyfin";
                href = "http://jellyfin.viteky.net";
                description = "Media Server";
              };
            }
            {
              Guacamole = {
                icon = "guacamole";
                href = "http://guacamole.viteky.net";
                description = "Virtual Machine Manager";
              };
            }
            {
              Paperless = {
                icon = "paperless";
                href = "http://paperless.viteky.net";
                description = "Archive Manager";
              };
            }
            {
              Cloudflared = {
                icon = "cloudflare";
                widget = {
                  type = "cloudflared";
                  accountid = "cb9830256808c62ee618dbfd9a908791";
                  tunnelid = "cfbe3587-1e94-4847-9bba-ff87da387e08";
                  key = "y7CgP4VfncSAPYDQExbQTMkho1uQNafD9XhTS3af";
                };
              };
            }
          ];
        }
      ];

      bookmarks = [
        {
          Developer = [
            {
              Github = [
                {
                  icon = "github";
                  href = "https://github.com";
                }
              ];
            }
            {
              Gitlab = [
                {
                  icon = "gitlab";
                  href = "https://gitlab.une.edu.au";
                }
              ];
            }
          ];
        }
        {
          Entertainment = [
            {
              YouTube = [
                {
                  icon = "youtube";
                  href = "https://youtube.com";
                }
              ];
            }
            {
              Twitch = [
                {
                  icon = "twitch";
                  href = "https://twitch.tv";
                }
              ];
            }
          ];
        }
      ];
    };
  };
}

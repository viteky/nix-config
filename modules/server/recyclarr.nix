{
  den.aspects.server.nixos = {config, ...}: {
    services.recyclarr = {
      enable = true;
      configuration = {
        radarr = {
          hd-bluray-web = {
            replace_existing_custom_formats = true;
            delete_old_custom_formats = true;
            base_url = "http://localhost:7878";
            api_key = {
              _secret = "/run/credentials/recyclarr.service/radarr-api_key";
            };
            include = [
              {template = "radarr-quality-definition-movie";}
              {template = "radarr-quality-profile-hd-bluray-web";}
              {template = "radarr-custom-formats-hd-bluray-web";}
            ];
            custom_formats = [
              {
                trash_ids = ["d6e9318c875905d6cfb5bee961afcea9"];
                assign_scores_to = [{name = "HD Bluray + WEB";}];
              }
            ];
          };
        };
        sonarr = {
          web-1080p-v4 = {
            replace_existing_custom_formats = true;
            delete_old_custom_formats = true;
            base_url = "http://localhost:8989";
            api_key = {
              _secret = "/run/credentials/recyclarr.service/sonarr-api_key";
            };
            include = [
              {template = "sonarr-quality-definition-series";}
              {template = "sonarr-v4-quality-profile-web-1080p";}
              {template = "sonarr-v4-custom-formats-web-1080p";}
            ];
            custom_formats = [
              {
                trash_ids = ["d6e9318c875905d6cfb5bee961afcea9"];
                assign_scores_to = [{name = "WEB-1080p";}];
              }
            ];
          };
        };
      };
    };

    systemd.services.recyclarr.serviceConfig.LoadCredential = [
      "radarr-api_key:${config.sops.secrets.radarr-api_key.path}"
      "sonarr-api_key:${config.sops.secrets.sonarr-api_key.path}"
    ];
  };
}

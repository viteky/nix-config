{config, ...}: {
  programs.rclone = {
    enable = true;
    remotes = {
      gdrive = {
        config = {
          type = "drive";
          scope = "drive";
        };
        secrets = {
          client_id = config.sops.secrets.gdrive-client-id.path;
          client_secret = config.sops.secrets.gdrive-client-secret.path;
          token = config.sops.secrets.gdrive-token.path;
        };
        mounts."" = {
          enable = true;
          mountPoint = "${config.home.homeDirectory}/Google Drive";
        };
      };
    };
  };

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/jaydenv/.config/sops/age/keys.txt";

    secrets = {
      gdrive-client-id = {};
      gdrive-client-secret = {};
      gdrive-token = {};
    };
  };
}

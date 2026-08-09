{inputs, ...}: {
  imports = [inputs.sops-nix.nixosModules.sops];
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/jaydenv/.config/sops/age/keys.txt";

    secrets = {
      cloudflared-creds = {};
      cloudflared-cert = {};
      ssh-key = {
        path = "/home/jaydenv/.ssh/id_ed25519";
        owner = "jaydenv";
      };
      nextcloud-admin-pass = {};
      radarr-api_key = {};
      sonarr-api_key = {};
      github_pat = {};
      gdrive-client-id = {};
      gdrive-client-secret = {};
    };
  };
}

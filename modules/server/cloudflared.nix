{
  den.aspects.server.nixos = {config, ...}: {
    services.cloudflared = {
      enable = true;
      # certificateFile = "${config.sops.secrets.cloudflared-cert.path}";
      tunnels = {
        cfbe3587-1e94-4847-9bba-ff87da387e08 = {
          default = "http_status:404";
          credentialsFile = "${config.sops.secrets.cloudflared-creds.path}";
        };
      };
    };
  };
}

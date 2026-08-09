{
  den.aspects.server.nixos = {
    services.paperless = {
      enable = true;
      settings = {
        PAPERLESS_URL = "https://paperless.viteky.net";
      };
    };
  };
}

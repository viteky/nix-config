{
  den.aspects.server.nixos = {
    services.qbittorrent = {
      enable = true;
      group = "media";
      webuiPort = 8081;
      serverConfig = {
        LegalNotice.Accepted = true;
        Preferences = {
          WebUI = {
            Username = "jaydenv";
            Password_PBKDF2 = "@ByteArray(6+t42DQfGsM+Q5VbIYjvEw==:/dy+BDNwDLnCX90sEfAK2EwRwnjMPWilS+hk7cxwOutnKVevJigcEfLj1c2Q0IxbiLQCxXQe803tJWGm4HEiKQ==)";
          };
        };
      };
    };
  };
}

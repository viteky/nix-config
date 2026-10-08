{den, ...}: let
  name = "Jayden Vitek";
  email = "jayden.vitek@gmail.com";
in {
  den.aspects.jaydenv = {
    includes = [
      den.batteries.primary-user
      (den.batteries.user-shell "fish")
    ];

    user = {
      description = name;
      hashedPassword = "$y$j9T$2D5SaX5FptP3DbhCWogiA/$JZ8n2BSwdZACqDxdYXsBdR8ZJMD3IawWoqGw7CWCV98";
      extraGroups = [
        "greeter"
        "audio"
        "video"
        "storage"
        "disk"
        "uucp"
        "dialout"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF+6jdJqzBry0v40WsCAI+9ahVDzgZFlMzlfi3bFys8l jaydenv@desktop"
      ];
    };

    homeManager = {
      programs.git = {
        enable = true;
        settings = {
          user = {inherit name email;};
          init.defaultBranch = "main";
          pull.rebase = true;
          push.autoSetupRemote = true;
        };
      };
    };

    nixos = {
      nix.settings.trusted-users = ["jaydenv"];
    };
  };
}

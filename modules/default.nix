{
  den,
  inputs,
  ...
}: {
  den.default = {
    includes = with den.batteries; [
      define-user
      host-aspects
      hostname
      inputs'
      self'
    ];

    nixos = {pkgs, ...}: {
      system.stateVersion = "24.05";
      nixpkgs = {
        config.allowUnfree = true;
        overlays = [
          inputs.nur.overlays.default
        ];
      };
      nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
      nix = {
        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          auto-optimise-store = true;

          substituters = [
            "https://cache.nixos.org/"
            "https://nix-community.cachix.org"
            "https://nvf.cachix.org"
          ];

          trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "nvf.cachix.org-1:GMQWiUhZ6ux9D5CvFFMwnc2nFrUHTeGaXRlVBXo+naI="
          ];
        };
      };

      i18n.defaultLocale = "en_AU.UTF-8";

      environment.systemPackages = with pkgs; [
        wget
        unzip
        sops
        # inputs.self.packages.${stdenv.hostPlatform.system}.nvf
        gcc
        gnumake
        gparted
      ];

      programs = {
        nh = {
          enable = true;
          clean.enable = true;
          flake = "/home/jaydenv/Projects/my-nix";
        };
      };
    };

    homeManager = {
      home.stateVersion = "24.05";
      nixpkgs = {
        config.allowUnfree = true;
        overlays = [
          inputs.nur.overlays.default
        ];
      };

      xdg = {
        enable = true;
        mime.enable = true;
        portal.xdgOpenUsePortal = true;
        userDirs = {
          enable = true;
          createDirectories = true;
          setSessionVariables = true;
        };

        terminal-exec = {
          enable = true;
          settings = {
            default = ["kitty.desktop"];
          };
        };
      };
    };
  };
}

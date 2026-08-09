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

      nix = {
        settings = {
          experimental-features = "nix-command flakes";
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

      environment.systemPackages = with pkgs; [
        devenv
        sbctl
        wget
        unzip
        sops
        # inputs.self.packages.${stdenv.hostPlatform.system}.nvf
        ## UNI
        gcc
        gnumake
      ];

      # xdg.mime = {
      #   enable = true;
      #   defaultApplications = {
      #     "image/*" = "imv.desktop";
      #     "text/*" = "nvim.desktop";
      #     "video/*" = "mpv.desktop";
      #     "application/zip" = "org.gnome.FileRoller.desktop";
      #     "application/*" = "dms-open.desktop";
      #   };
      # };

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

      fonts.fontconfig.enable = true;
      # services.gnome-keyring = {
      #   enable = true;
      #   components = ["pkcs11" "secrets" "ssh"];
      # };

      programs = {
        gh.enable = true;
        java.enable = true;
        direnv = {
          enable = true;
          nix-direnv.enable = true;
          silent = true;
        };
      };

      xdg = {
        enable = true;
        userDirs = {
          enable = true;
          createDirectories = true;
          setSessionVariables = true;
        };

        portal.xdgOpenUsePortal = true;
        mime.enable = true;
        # mimeApps = {
        #   enable = true;
        #   defaultApplications = {
        #     # "application/pdf" = "org.pwmt.zathura.desktop";
        #     "x-scheme-handler/http" = "firefox.desktop";
        #     "x-scheme-handler/https" = "firefox.desktop";
        #     # "x-scheme-handler/http" = "dms-open.desktop";
        #     # "x-scheme-handler/https" = "dms-open.desktop";
        #     "text/html" = "firefox.desktop";
        #     "x-scheme-handler/slack" = "slack.desktop";
        #     "x-scheme-handler/terminal" = "kitty.desktop";
        #     "inode/directory" = "org.gnome.Nautilus.desktop";
        #   };
        # };
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

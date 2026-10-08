{inputs, ...}: {
  flake-file.inputs = {
    vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
    };

    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
    };
  };

  den.aspects.editors.vscode = {
    homeManager = {
      pkgs,
      lib,
      host,
      ...
    }: {
      nixpkgs.overlays = [inputs.vscode-extensions.overlays.default];
      imports = [inputs.vscode-server.homeModules.default];
      services.vscode-server.enable = true;
      programs.vscode = {
        enable = true;
        # package = pkgs.vscode-fhs;
        profiles.default = {
          enableUpdateCheck = false;
          extensions = with pkgs.vscode-marketplace; [
            mkhl.direnv
            ms-vscode.live-server
            github.copilot-chat
            jnoortheen.nix-ide
            datakurre.devenv
            usernamehw.errorlens
            eamodio.gitlens
            aaron-bond.better-comments
            formulahendry.auto-rename-tag
            christian-kohler.path-intellisense
            gruntfuggly.todo-tree
          ];

          userSettings = {
            "workbench.colorTheme" = lib.mkForce "Catppuccin Macchiato";
            "editor.fontLigatures" = "'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'ss10', 'liga'";

            "nix.enableLanguageServer" = true;
            "nix.serverPath" = "nixd";

            "nix.serverSettings" = {
              "nixd" = {
                "nixpkgs" = {
                  "expr" = "import <nixpkgs> { }";
                };
                "formatting" = {
                  "command" = ["alejandra"];
                };
                "options" = {
                  "nixos" = {
                    "expr" = "(builtins.getFlake (toString ./.)).nixosConfigurations.${host.name}.options";
                  };
                  "home_manager" = {
                    "expr" = "(builtins.getFlake (toString ./.)).nixosConfigurations.${host.name}.options.home-manager.users.type.getSubOptions []";
                  };
                };
              };
            };
          };
        };
      };

      home.packages = [
        pkgs.nixd
        pkgs.alejandra
      ];
    };
  };
}

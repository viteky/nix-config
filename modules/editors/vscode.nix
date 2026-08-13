{
  den.aspects.editors.vscode = {
    homeManager = {
      pkgs,
      lib,
      host,
      ...
    }: {
      programs.vscode = {
        enable = true;
        package = pkgs.vscode-fhs;
        profiles.default = {
          enableUpdateCheck = false;
          extensions = with pkgs.vscode-extensions; [
            mkhl.direnv
            ms-vscode.live-server
            vscodevim.vim
            github.copilot-chat
            jnoortheen.nix-ide
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
        ((pkgs.vscode.override {isInsiders = true;}).overrideAttrs (oldAttrs: {
          src = fetchTarball {
            url = "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64";
            sha256 = "0mb66n7fz6mdcqjqx381fsdz3cm476yrabrb3g5yma18vgdvm39v";
          };
          version = "latest";
          buildInputs = oldAttrs.buildInputs ++ [pkgs.krb5];
        }))
      ];
    };
  };
}

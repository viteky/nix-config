{ inputs, outputs, lib, config, pkgs, ...}:

  {
  nixpkgs = {
    # You can add overlays here
    overlays = [
      (_: _:
        {
          awesome = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-luajit-git;
        })
    ];
  };

    services.xserver.windowManager = {
      awesome = {
        enable = true;

        luaModules = lib.attrValues {
        inherit (pkgs.luajitPackages) lgi ldbus luadbi-mysql luaposix;
        };
      };
    };
  }
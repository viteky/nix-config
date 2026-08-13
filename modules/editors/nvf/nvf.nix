{
  inputs,
  den,
  ...
}: {
  imports = [
    inputs.den.flakeModule
    inputs.den.flakeOutputs.packages
  ];

  den.schema.flake-system.includes = [den.aspects.flake];

  den.aspects.flake.packages = {pkgs, ...}: let
    # custom den.lib.nvf from ./nvf-integration.nix
    nvf = den.lib.nvf.package pkgs;
  in {
    nvf = nvf den.aspects.neovim;
  };

  den.aspects.neovim = {
    homeManager = {
      home.packages = [
      ];
    };
  };
}

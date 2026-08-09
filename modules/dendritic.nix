{inputs, ...}: {
  imports = [
    (inputs.flake-file.flakeModules.dendritic or {})
    (inputs.den.flakeModules.dendritic or {})
    # inputs.flake-file.flakeModules.allfollow
  ];

  # other inputs may be defined at a module using them.
  flake-file.inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    den.url = "github:denful/den";
    flake-file.url = "github:vic/flake-file";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  flake-file.formatter = {pkgs, ...}: pkgs.alejandra;
}

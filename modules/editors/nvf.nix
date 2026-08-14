{inputs, ...}: {
  flake-file.inputs = {
    nvf-config.url = "github:viteky/nvf-config";
  };

  den.aspects.editors.nvf = {
    homeManager = {pkgs, ...}: {
      home.packages = [inputs.nvf-config.packages.${pkgs.stdenv.hostPlatform.system}.default];
    };
  };
}

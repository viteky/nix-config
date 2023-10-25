{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
      owner = "viteky";
      repo = "sddm-themes";
      rev = "baf6f8bb779c490ceceb4560a989443b1afab22f";
      sha256 = "EmAAloXHs7l/gvXoERnjI2bTZp8ACaKpFSVWO8KXpHo=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    '';
}
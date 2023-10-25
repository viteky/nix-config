{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "grub-theme";
  src = pkgs.fetchFromGitHub {
      owner = "dracula";
      repo = "grub";
      rev = "0e721d99dbf0d5d6c4fd489b88248365b7a60d12";
      sha256 = "SBAXGJbNYdr89FSlqzgkiW/c23yTHYvNxxU8F1hMfXI=";
  };
  installPhase = ''
    mkdir -p $out
    cd dracula
    cp -R ./* $out/
    '';
}
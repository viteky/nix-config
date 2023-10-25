{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "grub-theme";
  src = pkgs.fetchFromGitHub {
      owner = "nautilor";
      repo = "nord-sddm";
      rev = "ad72c3c7048c8aabe85bab41cbeab5f3c4502250";
      sha256 = "02idn5hggbqc0j01vhxij5nh748sgva123103d5ir0nl676rl782";
  };
  installPhase = ''
    mkdir -p $out
    cd Nord
    cp -R ./* $out/
    '';
}
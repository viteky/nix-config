{
  den.aspects.desktop = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        libreoffice-fresh
        hunspell
        hunspellDicts.en_AU
        x2goclient
        kdePackages.kdenlive
        gnome-calculator
        gimp
        bitwarden-cli
      ];
    };
  };
}

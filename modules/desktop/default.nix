{
  den.aspects.desktop = {
    nixos = {
      programs.dconf.enable = true;
      programs.seahorse.enable = true;
      fonts.fontconfig.enable = true;
      hardware.bluetooth.enable = true;
      security = {
        polkit.enable = true;
        rtkit.enable = true;
        sudo.wheelNeedsPassword = false;
        pam.services.greetd.enableGnomeKeyring = true;
      };

      services = {
        gnome.gnome-keyring.enable = true;
        pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
          jack.enable = true;
        };
      };
    };

    homeManager = {
      programs.mpv.enable = true;
      fonts.fontconfig.enable = true;
    };
  };
}

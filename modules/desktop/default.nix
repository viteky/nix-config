{
  den.aspects.desktop = {
    nixos = {pkgs, ...}: {
      programs = {
        dconf.enable = true;
        seahorse.enable = true;
        nm-applet.enable = true;
        kdeconnect.enable = true;
      };

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

      environment.systemPackages = with pkgs; [
        glib
        sshfs
        android-tools
        scrcpy
        libreoffice
        hunspell
        hunspellDicts.en_AU
        kdePackages.kdenlive
        gnome-calculator
        gimp
        bitwarden-cli
        zenity

        (x2goclient.overrideAttrs (oldAttrs: {
          postInstall =
            (oldAttrs.postInstall or "")
            + ''
              wrapProgram $out/bin/x2goclient --set QT_QPA_PLATFORM xcb
            '';
        }))
      ];
    };

    homeManager = {
      programs.mpv.enable = true;
      fonts.fontconfig.enable = true;
      services.kdeconnect.enable = true;
    };
  };
}

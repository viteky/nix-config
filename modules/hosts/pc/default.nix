{den, ...}: {
  den.hosts.x86_64-linux.pc.users.jaydenv = {};

  den.aspects.pc = {
    includes = with den.aspects; [
      desktop
      nvidia
      stylix
      catppuccin
      tui
      development
      virtualisation
      gaming
      editors.vscode
      desktop.noctalia
    ];

    nixos = {
      boot.loader.limine.extraEntries = ''
        /Windows
          protocol: efi
          path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
      '';
    };
  };
}

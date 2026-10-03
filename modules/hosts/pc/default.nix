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
      development.docker
      virtualisation
      gaming
      editors.vscode
      desktop.noctalia
      editors.nvf
      secureBoot
    ];
  };
}

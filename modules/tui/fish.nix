{
  den.aspects.tui = {
    homeManager.programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
      '';
      shellAliases = {
        cd = "z";
        cat = "bat";
      };
    };
  };
}

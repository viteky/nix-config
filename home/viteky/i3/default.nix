{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-rounded;
    config = {
      modifier = "Mod4";

      fonts = "JetBrainsMono Nerd Font";

      floating = {
        modifier = "Mod4";
      };

      keybindings = {
        
      };
    };
  };
}
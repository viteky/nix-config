{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        "TERM" = "xterm-256color";
      };
      
      window.opacity = 0.9;

      window = {
        padding.x = 10;
        padding.y = 10;
      };
    };
  };
}

{
  den.aspects.tui.homeManager = {pkgs, ...}: {
    programs.yazi = {
      enable = true;
      plugins = {
        inherit
          (pkgs.yaziPlugins)
          full-border
          starship
          git
          ;
      };
      enableZshIntegration = true;
      shellWrapperName = "y";
      initLua = ''
        require("full-border"):setup()
        require("starship"):setup()
        require("git"):setup()
      '';
      settings.plugin.prepend_fetchers = [
        {
          id = "git";
          name = "*";
          run = "git";
        }
        {
          id = "git";
          name = "*/";
          run = "git";
        }
      ];
    };
  };
}

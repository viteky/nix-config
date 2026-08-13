{
  den.aspects.tui.homeManager = {pkgs, ...}: {
    programs.yazi = {
      enable = true;
      shellWrapperName = "y";
      plugins = {
        full-border = {
          package = pkgs.yaziPlugins.full-border;
          setup = true;
        };
        starship = {
          package = pkgs.yaziPlugins.starship;
          setup = true;
        };
        git = {
          package = pkgs.yaziPlugins.git;
          setup = true;
        };
        clipboard = pkgs.yaziPlugins.clipboard;
        smart-enter = pkgs.yaziPlugins.smart-enter;
      };

      settings.plugin.prepend_fetchers = [
        {
          url = "*";
          run = "git";
          group = "git";
        }
        {
          url = "*/";
          run = "git";
          group = "git";
        }
      ];

      keymap.mgr.prepend_keymap = [
        {
          on = "y";
          run = ["yank" "plugin clipboard -- --action=copy"];
          desc = "Yank selected files (copy)";
        }
        {
          on = "x";
          run = ["yank --cut" "plugin clipboard -- --action=copy"];
          desc = "Yank selected files (cut)";
        }
        {
          on = "<C-p>";
          run = "plugin clipboard -- --action=paste";
          desc = "Paste yanked system clipboard files";
        }
        {
          on = "l";
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }
      ];
    };
  };
}

{
  den.aspects.tui = {
    homeManager = {
      programs = {
        eza = {
          enable = true;
          colors = "always";
          icons = "always";
        };
        # nix-index.enable = true;
        # nix-index-database.comma.enable = true;
        bat.enable = true;
        btop.enable = true;
        fzf = {
          enable = true;
          enableZshIntegration = true;
          defaultOptions = [
            "--height 40%"
            "--border"
            "--layout reverse"
            "--style full"
          ];
          fileWidgetOptions = [
            "--preview 'bat --style=numbers --color=always {}'"
          ];
        };
        lazygit.enable = true;
        zoxide.enable = true;
        lazydocker.enable = true;
        lazysql.enable = true;
        fd.enable = true;
        ripgrep.enable = true;
        tealdeer.enable = true;
      };
    };
  };
}

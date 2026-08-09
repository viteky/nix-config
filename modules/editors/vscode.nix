{
  den.aspects.editors.vscode = {
    homeManager = {pkgs, ...}: {
      programs.vscode = {
        enable = true;
        package = pkgs.vscode-fhs;
        mutableExtensionsDir = true;
        profiles.default = {
          enableUpdateCheck = false;
          extensions = with pkgs.vscode-extensions; [
            mkhl.direnv
            bbenoist.nix
            ms-vscode.live-server
            vscodevim.vim
            github.copilot-chat
          ];
        };
      };
    };
  };
}

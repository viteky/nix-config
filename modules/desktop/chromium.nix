{
  den.aspects.desktop = {
    homeManager = {pkgs, ...}: {
      programs.chromium = {
        enable = true;
        package = pkgs.brave;
        extensions = [
          {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # Ublock origin
          {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
        ];
      };
    };
  };
}

{
  den.aspects.tui.homeManager = {
    pkgs,
    lib,
    user,
    ...
  }: let
    starshipPreset = fromTOML (builtins.readFile "${pkgs.starship}/share/starship/presets/nerd-font-symbols.toml");
  in {
    programs = {
      starship = {
        enable = true;
        enableTransience = true;
        settings = lib.mkMerge [
          starshipPreset
          {
            scala = {
              # Ignore the .metals directory in the home folder
              detect_folders = ["!${user.userName}"];
            };
          }
        ];
      };
    };
  };
}

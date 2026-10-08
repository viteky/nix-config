{
  den.aspects.tui.homeManager = {
    user,
    lib,
    ...
  }: {
    programs = {
      starship = {
        enable = true;
        enableTransience = true;
        presets = ["nerd-font-symbols" "bracketed-segments"];
        settings = lib.mkMerge [
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

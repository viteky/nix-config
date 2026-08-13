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

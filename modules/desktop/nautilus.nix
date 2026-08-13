{
  den.aspects.desktop = {
    nixos = {
      pkgs,
      lib,
      ...
    }: {
      services = {
        gvfs.enable = true;
        tumbler.enable = true;
        udisks2.enable = true;
      };

      programs.nautilus-open-any-terminal = {
        enable = true;
        terminal = lib.mkDefault "kitty";
      };

      environment.systemPackages = with pkgs; [
        nautilus
        libheif
        libheif.out
        file-roller
      ];

      environment.pathsToLink = ["share/thumbnailers"];

      xdg.mime = {
        enable = true;
        defaultApplications = {
          "inode/directory" = "org.gnome.Nautilus.desktop";
        };
      };
    };

    homeManager = {user, ...}: {
      services.udiskie.enable = true;
      gtk.gtk3.bookmarks = [
        "file:///home/${user.name}/Documents"
        "file:///home/${user.name}/Downloads"
        "file:///home/${user.name}/Pictures"
        "file:///home/${user.name}/Videos"
        "file:///home/${user.name}/Music"
        "file:///home/${user.name}/Projects"
      ];
    };
  };
}

# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example
    ./alacritty
    ./sway.nix
  ];
  
  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "viteky";
    homeDirectory = "/home/viteky";
  };

  home.packages = with pkgs; [
    autorandr
    firefox
    gh
    gimp
    gnome.seahorse
    btop
    neofetch
    nitrogen
    neovim
    lxappearance
    obs-studio
    ranger

    # Rofi
    rofi
    rofi-power-menu
    rofi-screenshot
    rofi-bluetooth
    
    spice-protocol
    spice
    spice-gtk
    spotify
    steam
    unzip
    virt-manager
    virt-viewer
    win-virtio
    win-spice
    xfce.thunar

    # Fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    font-awesome
  ];


  # Git
  programs.git = {
    enable = true;
    userName = "viteky";
    userEmail = "jayden.vitek@gmail.com";
  };

  # Bash
  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///session"];
      uris = ["qemu:///session"];
    };
  };

  services.picom = {
    enable = true;
    activeOpacity = 1;
    fade = true;
    inactiveOpacity = 0.9;
    menuOpacity = 1;
  };

  # Themes
  gtk = {
    enable = true;
    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Ice";
    theme.package = pkgs.gruvbox-gtk-theme;
    theme.name = "Gruvbox GTK Theme";
    iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
    iconTheme.name = "gruvbox-dark-icons-gtk";
  };


  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };
  
  home.pointerCursor = {
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
  };

  # Awesome 
  xdg.configFile.awesome = {
    source = ./awesome;
    recursive = true;
  };
  xsession.windowManager.awesome = {
    enable = true;
  };

  fonts.fontconfig.enable = true;

  programs.vscode = {
  enable = true;
  package = pkgs.vscode.fhs;
  };
  

  programs.waybar = {
    enable = true;
  };
  xdg.configFile.waybar = {
    source = ./waybar;
    recursive = true;
  };

  xdg.configFile.qtile = {
    source = ./qtile;
    recursive = true;
  };
  
  services.swayosd.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

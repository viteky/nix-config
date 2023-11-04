# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{inputs, outputs, lib, config, pkgs, ...}: 

{  

  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example
    ./alacritty
    ./rofi
    inputs.nix-colors.homeManagerModules.default
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

  colorScheme = inputs.nix-colors.colorSchemes.dracula;
  
  home = {
    username = "viteky";
    homeDirectory = "/home/viteky";
  };

  home.packages = with pkgs; [
    autorandr
    bitwarden
    bitwarden-cli
    discord
    firefox
    flameshot
    fzf
    gh
    gimp
    gnome.seahorse
    btop
    neofetch
    nitrogen
    neovim
    libreoffice-fresh
    lxappearance
    obs-studio
    ranger
    lutris
    pavucontrol
    spice-protocol
    spice
    spice-gtk
    spotify
    steam
    thunderbird
    unzip
    ueberzug
    virt-manager
    virt-viewer
    vlc
    win-virtio
    win-spice
    xdg-user-dirs
   
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

  programs.starship.enable = true;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellAliases = {
    };
    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc; }
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish; }
      { name = "hydro"; src = pkgs.fishPlugins.hydro; }
      { name = "z"; src = pkgs.fishPlugins.z; }
    ];
  };


  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///session"];
      uris = ["qemu:///session"];
    };
  };

  services.picom = {
    enable = true;
    package = pkgs.picom-allusive;
  };

  # Themes
  gtk = {
    enable = true;
    cursorTheme.name = "Dracula-cursors";
    theme.package = pkgs.dracula-theme;
    theme.name = "Dracula";
    iconTheme.package = pkgs.dracula-icon-theme;
    iconTheme.name = "Dracula";
  };


  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "Dracula";
    style.package = pkgs.dracula-theme;
  };
  
  home.pointerCursor = {
    x11.enable = true;
    package = pkgs.dracula-theme;
    name = "Dracula-cursors";
  };

  fonts.fontconfig.enable = true;

  programs.vscode = {
  enable = true;
  package = pkgs.vscode.fhs;
  };

  xdg.configFile.qtile = {
    source = ./qtile;
    recursive = true;
  };
  
  xdg.configFile.ranger = {
    source = ./ranger;
    recursive = true;
  };

  xdg.configFile.betterlockscreen = {
    source = ./betterlockscreen;
    recursive = true;
  };
  
  xdg.configFile.picom = {
    source = ./picom;
    recursive = true;
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      documents = "${config.home.homeDirectory}/Documents";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Pictures";
      videos = "${config.home.homeDirectory}/Videos";
    };
  };

  services.betterlockscreen.enable = true;
  services.dunst.enable = true;
  services.gnome-keyring.enable = true;

  home = {
    activation = {
    installAwesomeConfig = lib.hm.dag.entryAfter ["writeBoundary"]''
        ln -s "${config.home.homeDirectory}/.nix-config/home/viteky/awesome" "${config.home.homeDirectory}/.config"
        cp -r ${inputs.charitable.outPath} ${config.home.homeDirectory}/.config/awesome/charitable
        cp -r ${inputs.bling.outPath} ${config.home.homeDirectory}/.config/awesome/bling
        cp -r ${inputs.awesome-wm-widgets.outPath} "${config.home.homeDirectory}/.config/awesome/awesome-wm-widgets"
      '';  
    };
  };
  
  # Enable home-manager
  programs.home-manager.enable = true;
  
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

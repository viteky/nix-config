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

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
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
    alacritty
    brave
    firefox
    gh
    gimp
    htop
    neofetch
    nitrogen
    obs-studio
    rofi
    steam
    virt-manager
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

  # Symlink config files
  home.file.".config" = {
    source = ../.config;
    recursive = true;
  };

  # Enable awesomewm
  xsession.windowManager.awesome.enable = true;
  xdg.configFile."awesome/rc.lua".source = ../.config/awesome/rc.lua;

  # Enable i3wm
  xsession.windowManager.i3.enable = true;

  # Enable qtile config
  xdg.configFile."qtile/config.py".source = ../.config/qtile/config.py;

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

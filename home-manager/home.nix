{ pkgs, vars, inputs, ... }: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  imports = [
    ./hyprland.nix
    ./wofi.nix
    ./wofi-powermenu.nix
    ./waybar.nix
    ./alacritty.nix
    ./git.nix
    ./neovim.nix
    ./git.nix
    ./sops.nix
    ./zsh.nix
  ];


  home.username = vars.username;
  home.homeDirectory = "/home/${vars.username}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = vars.nix.stateVersion; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    #sddm
    dunst
    libnotify
    rofi-wayland
    swww
    # move later
    git
    firefox
    vscode
    telegram-desktop
    spotify-player
    pcmanfm
    lxmenu-data
    shared-mime-info
    wl-clipboard
    google-chrome
    nodejs
    keepassxc
    slurp
    grim
    swappy
    nwg-displays
    wlr-randr
    vagrant
    age
    cherrytree
    nodePackages_latest.eslint
    obsidian
    jetbrains.pycharm-community
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/richtig/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  gtk = {
    enable = true;
    theme.package = pkgs.catppuccin-gtk.override {
      accents = [ "mauve" ];
      size = "compact";
      tweaks = [ "rimless" "black" ];
      variant = "mocha";
    };
    theme.name = "Catppuccin-Mocha-Compact-Mauve-Dark";
    cursorTheme.package = pkgs.apple-cursor;
    cursorTheme.name = "macOS-BigSur";
    cursorTheme.size = 24;
    iconTheme.package = pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus-Dark";
  };

  nixpkgs.config.allowUnfree = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  }

{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "darkfleet";
  home.homeDirectory = "/home/darkfleet";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
    xclip
    wget
    git
    bat		# Btter cat Command
    fzf		# Fuzzy Finder
    fd		# Better find Command
    eza		# Better ls Command
    jq		# Command Line JSON Processor
    ripgrep	# Command Line Search Tool
    yazi	# Command Line File Manager
    lazydocker	# Command Line Docker Manager
    tmux
    neovim
    go
    delve
    lua
    cargo
    zig
  ];

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/darkfleet/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Install programs with configurations via Home Manager
  programs = {
    zsh = (import ./zsh.nix{ inherit pkgs; });
    wezterm = (import ./wezterm.nix{ inherit pkgs; });
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".p10k.zsh".source = ~/dev-env/dotfiles/p10k.zsh;
    ".config/nvim" = {
      source = ~/dev-env/dotfiles/nvim;
      recursive = true;
    };
    ".ready-tmux".source = ~/dev-env/dotfiles/ready-tmux;
    ".tmux.conf".source = ~/dev-env/dotfiles/tmux.conf;
    ".tmux/plugins/tpm".source = builtins.fetchGit {
      url = "https://github.com/tmux-plugins/tpm";
      rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946";
    };
    ".config/rofi" = {
      source = ~/dev-env/dotfiles/rofi;
      recursive = true;
    };
    ".config/waybar" = {
      source = ~/dev-env/dotfiles/waybar;
      recursive = true;
    };
    ".local/scripts" = {
      source = ~/dev-env/dotfiles/local/scripts;
      recursive = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

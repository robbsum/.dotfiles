{
  config,
  pkgs,
  ...
}: {
  # Configure Neovim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
  };

  # Config
  home.file."${config.xdg.configHome}/nvim" = {
    source = ./config;
    recursive = true;
  };

  # Additional packages
  home.packages = with pkgs; [
    gcc
    ripgrep
  ];
}

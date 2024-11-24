{
  # Configure Eza
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    extraOptions = [
      "--header"
      "--group-directories-first"
    ];
  };
}

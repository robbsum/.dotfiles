{config, ...}: {
  # Configure Git
  programs.git = {
    enable = true;
    userName = "robbsum";
    userEmail = "robbsum@gmail.com";
    extraConfig = {
      gpg.format = "ssh";
      commit.gpgsign = true;
      user.signingkey = "${config.home.homeDirectory}/.ssh/robbsum.pub";
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
    };
  };
}

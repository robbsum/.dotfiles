{pkgs, ...}: {
  # Configure GTK
  gtk = {
    enable = true;
    font = {
      name = "Inter";
      package = pkgs.inter;
    };
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-nord.override {
        accent = "frostblue1";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      size = 12;
      package = pkgs.bibata-cursors;
    };
  };
}

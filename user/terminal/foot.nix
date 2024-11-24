let
  # Font family
  font = "SauceCodePro Nerd Font";

  # Font size
  size = "10.7";
in {
  # Configure Foot
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";

        font = "${font}:size=${size}:style=SemiBold";
        font-bold = "${font}:size=${size}:style=Bold";
        font-italic = "${font}:size=${size}:style=Italic";
        font-bold-italic = "${font}:size=${size}:style=Bold,Italic";
        line-height = 19;
        underline-offset = 19;
      };
    };
  };
}

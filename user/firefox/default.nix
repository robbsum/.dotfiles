{
  lib,
  pkgs,
  ...
}: {
  # Configure Firefox
  programs.firefox = {
    enable = true;
    profiles = {
      luna = {
        isDefault = true;
        settings = {
          # Auto install extensions
          "extensions.autoDisableScopes" = 0;
        };
        extensions = lib.attrValues (
          import ./addons.nix {
            inherit (pkgs) fetchurl lib stdenv;
          }
        );
      };
    };
  };
}

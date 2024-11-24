{
  lib,
  pkgs,
  ...
}: {
  # Configure Firefox
  programs.firefox = {
    enable = true;
    policies = {
      DisablePocket = true;
    };
    profiles = {
      luna = {
        isDefault = true;
        settings = {
          # Fully disable Pocket
          "extensions.pocket.enabled" = false;
          "extensions.pocket.api" = "0.0.0.0";
          "extensions.pocket.loggedOutVariant" = "";
          "extensions.pocket.oAuthConsumerKey" = "";
          "extensions.pocket.onSaveRecs" = false;
          "extensions.pocket.onSaveRecs.locales" = "";
          "extensions.pocket.showHome" = false;
          "extensions.pocket.site" = "0.0.0.0";
          "browser.newtabpage.activity-stream.pocketCta" = "";
          "browser.newtabpage.activity-stream.section.highlights.includePocket" =
            false;
          "services.sync.prefs.sync.browser.newtabpage.activity-stream.section.highlights.includePocket" =
            false;

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

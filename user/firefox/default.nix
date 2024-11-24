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

          # Disable crappy home activity stream page
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
          "browser.newtabpage.blocked" = lib.genAttrs [
            # Youtube
            "26UbzFJ7qT9/4DhodHKA1Q=="
            # Facebook
            "4gPpjkxgZzXPVtuEoAL9Ig=="
            # Wikipedia
            "eV8/WsSLxHadrTL1gAxhug=="
            # Reddit
            "gLv0ja2RYVgxKdp0I5qwvA=="
            # Amazon
            "K00ILysCaEq8+bEqV/3nuw=="
            # Twitter
            "T9nJot5PurhJSy8n038xGA=="
          ] (_: 1);

          # Layout
          "browser.uiCustomization.state" = builtins.toJSON {
            currentVersion = 20;
            newElementCount = 5;
            dirtyAreaCache = ["nav-bar" "PersonalToolbar" "toolbar-menubar" "TabsToolbar" "widget-overflow-fixed-list"];
            placements = {
              PersonalToolbar = ["personal-bookmarks"];
              TabsToolbar = ["tabbrowser-tabs" "new-tab-button" "alltabs-button"];
              nav-bar = ["back-button" "forward-button" "stop-reload-button" "urlbar-container" "downloads-button" "touch-vpn_anchorfree_com-browser-action" "unified-extensions-button" "reset-pbm-toolbar-button"];
              toolbar-menubar = ["menubar-items"];
              unified-extensions-area = [];
              widget-overflow-fixed-list = [];
            };
            seen = ["save-to-pocket-button" "developer-button" "ublock0_raymondhill_net-browser-action" "touch-vpn_anchorfree_com-browser-action" "sponsorblocker_ajay_app-browser-action" "_testpilot-containers-browser-action"];
          };

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

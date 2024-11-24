{
  fetchurl,
  lib,
  stdenv,
}: let
  buildFirefoxXpiAddon = lib.makeOverridable ({
    pname,
    version,
    addonId,
    url,
    sha256,
    meta,
    ...
  }:
    stdenv.mkDerivation {
      name = "${pname}-${version}";

      inherit meta;

      src = fetchurl {inherit url sha256;};

      preferLocalBuild = true;
      allowSubstitutes = true;

      passthru = {inherit addonId;};

      buildCommand = ''
        dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
        mkdir -p "$dst"
        install -v -m644 "$src" "$dst/${addonId}.xpi"
      '';
    });
in {
  "sponsorblock" = buildFirefoxXpiAddon {
    pname = "sponsorblock";
    version = "5.9.6";
    addonId = "sponsorBlocker@ajay.app";
    url = "https://addons.mozilla.org/firefox/downloads/file/4385525/sponsorblock-5.9.6.xpi";
    sha256 = "1112b79a0a10a9d19ec470585af245b25a2caf1302751553886d2975c07e5655";
    meta = with lib; {
      homepage = "https://sponsor.ajay.app";
      description = "Easily skip YouTube video sponsors. When you visit a YouTube video, the extension will check the database for reported sponsors and automatically skip known sponsors. You can also report sponsors in videos. Other browsers: https://sponsor.ajay.app";
      license = licenses.lgpl3;
      mozPermissions = [
        "storage"
        "scripting"
        "https://sponsor.ajay.app/*"
        "https://*.youtube.com/*"
        "https://www.youtube-nocookie.com/embed/*"
      ];
      platforms = platforms.all;
    };
  };
  "touch-vpn" = buildFirefoxXpiAddon {
    pname = "touch-vpn";
    version = "5.0.18";
    addonId = "touch-vpn@anchorfree.com";
    url = "https://addons.mozilla.org/firefox/downloads/file/4172379/touch_vpn-5.0.18.xpi";
    sha256 = "a3e7eafd7545393a29f516cf7ff8baa85ee2d4081a8690111810495ebaeed46f";
    meta = with lib; {
      homepage = "https://www.northghost.com";
      description = "Unblock any blocked website and stay secure with Touch VPN. One-click connect to unrestricted browsing through our fast VPN connection. Unlimited bandwidth and completely FREE!";
      mozPermissions = [
        "<all_urls>"
        "tabs"
        "storage"
        "proxy"
        "webRequest"
        "webRequestBlocking"
        "management"
        "notifications"
        "unlimitedStorage"
        "privacy"
        "*://*/*"
      ];
      platforms = platforms.all;
    };
  };
  "ublock-origin" = buildFirefoxXpiAddon {
    pname = "ublock-origin";
    version = "1.61.0";
    addonId = "uBlock0@raymondhill.net";
    url = "https://addons.mozilla.org/firefox/downloads/file/4382536/ublock_origin-1.61.0.xpi";
    sha256 = "e6fd55b799a568c66c10892a8f22428e6773fe16d7466ce9dee2952f224b203d";
    meta = with lib; {
      homepage = "https://github.com/gorhill/uBlock#ublock-origin";
      description = "Finally, an efficient wide-spectrum content blocker. Easy on CPU and memory.";
      license = licenses.gpl3;
      mozPermissions = [
        "alarms"
        "dns"
        "menus"
        "privacy"
        "storage"
        "tabs"
        "unlimitedStorage"
        "webNavigation"
        "webRequest"
        "webRequestBlocking"
        "<all_urls>"
        "http://*/*"
        "https://*/*"
        "file://*/*"
        "https://easylist.to/*"
        "https://*.fanboy.co.nz/*"
        "https://filterlists.com/*"
        "https://forums.lanik.us/*"
        "https://github.com/*"
        "https://*.github.io/*"
        "https://github.com/uBlockOrigin/*"
        "https://ublockorigin.github.io/*"
        "https://*.reddit.com/r/uBlockOrigin/*"
      ];
      platforms = platforms.all;
    };
  };
}

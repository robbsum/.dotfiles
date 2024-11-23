{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # Configure Boot
  boot = {
    extraModulePackages = [];
    kernelModules = ["kvm-intel"];
    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc"];
      kernelModules = [];
    };
  };

  # Configure Filesystems
  fileSystems = {
    # Root
    "/" = {
      fsType = "ext4";
      device = "/dev/disk/by-label/NIXOS-ROOT";
    };

    # Boot
    "/boot" = {
      fsType = "vfat";
      device = "/dev/disk/by-label/NIXOS-BOOT";
      options = ["fmask=0077" "dmask=0077"];
    };

    # Home
    "/home" = {
      fsType = "ext4";
      device = "/dev/disk/by-label/NIXOS-HOME";
    };
  };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;

  # Host platform
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Update microcode
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./programs.nix
    ./desktop.nix
  ];

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 13;
  };

  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "callipygous";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Kolkata";

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  users.users.reuben = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "storage" ];
    shell = pkgs.fish;
  };

  system.stateVersion = "24.05";
}

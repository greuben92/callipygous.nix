{ config, lib, pkgs, ... }:
{
  hardware.graphics.extraPackages = [ pkgs.amdvlk ];

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    desktopManager.gnome.enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  environment.gnome.excludePackages = [
    pkgs.gnome-tour
    pkgs.gnome-user-docs
    pkgs.orca # Screen reader
    pkgs.epiphany # Gnome web browser
    pkgs.gnome-console
    pkgs.gnome.gnome-contacts
    pkgs.gnome.gnome-maps
    pkgs.gnome.gnome-music
    pkgs.gnome.gnome-weather
    pkgs.gnome-connections
    pkgs.simple-scan
    pkgs.snapshot
    # pkgs.totem
    pkgs.yelp
    pkgs.geary # email client
  ];

  # Disable services enabled by gnome
  services.avahi.enable = false;
  services.geoclue2.enable = false;
  hardware.pulseaudio.enable = false;
  services.gnome.gnome-online-accounts.enable = false;
  services.gnome.gnome-online-miners.enable = lib.mkForce false;
  services.gnome.tracker.enable = false;
}

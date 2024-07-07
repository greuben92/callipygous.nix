{ config, lib, pkgs, ... }:
{
  programs.fish.enable = true;
  programs.gnupg.agent.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    git
    tree
    vim
    wget
    ripgrep
  ];

  users.users.reuben.packages = with pkgs; [
    brave
    chromium
    firefox
    foot
    neovim
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    hermit
  ];
}

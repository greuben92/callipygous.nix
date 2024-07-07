{ config, lib, pkgs, ... }:
{
  programs.fish.enable = true;
  programs.gnupg.agent.enable = true;
  programs.direnv.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    fzf
    git
    ripgrep
    tree
    vim
    wget
  ];

  users.users.reuben.packages = with pkgs; [
    brave
    chromium
    firefox
    foot
    neovim
    tmux
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    hermit
  ];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}

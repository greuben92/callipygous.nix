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
    zig # Required to build treesitter parsers for neovim
  ];

  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    hermit
    (nerdfonts.override { fonts = [ "CascadiaCode" "Iosevka" "JetBrainsMono" "SourceCodePro" ]; })
  ];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}

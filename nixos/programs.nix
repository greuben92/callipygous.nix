{ config, lib, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
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
    trash-cli
    jq
  ];

  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    hermit
    (nerdfonts.override { fonts = [ "CascadiaCode" "Iosevka" "JetBrainsMono" "SourceCodePro" "ComicShannsMono" ]; })
  ];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  services.postgresql = {
    enable = true;
    authentication = pkgs.lib.mkOverride 10 ''
      local all all trust
      host all all 127.0.0.1/32 trust
      host all all ::1/128 trust
    '';
  };
}

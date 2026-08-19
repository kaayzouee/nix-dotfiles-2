{ ... }:

{
  home.stateVersion = "26.05";

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  catppuccin.xfce4-terminal.enable = true;

  programs.home-manager.enable = true;
}

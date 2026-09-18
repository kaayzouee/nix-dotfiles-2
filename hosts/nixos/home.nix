{ ... }:

{
  home.stateVersion = "26.05";

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  imports = [
    ../../modules/theming/cursor.nix
    ../../modules/programs/tmux.nix
    ../../modules/programs/fastfetch.nix
  ];
  
  home.username = "kay";
  home.homeDirectory = "/home/kay";

  catppuccin.xfce4-terminal.enable = true;

  programs.home-manager.enable = true;

}

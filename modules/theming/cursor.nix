{ pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    package = pkgs.catppuccin-cursors;
    name = "catppuccin-mocha-mauve-cursors";
    size = 24;

    gtk.enable = true;
  };
}

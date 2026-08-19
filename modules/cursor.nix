{ pkgs, ... }:

{
gtk = {
  enable = true;

  cursorTheme = {
    name = "catppuccin-mocha-mauve-cursors";
    size = 24;
  };
};
}

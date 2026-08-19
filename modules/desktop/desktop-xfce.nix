# modules/desktop-xfce.nix
{ config, pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  services.flatpak.enable = true;

  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
    xkb.layout = "us";
  };
  
  security.pam.services.lightdm.allowNullPassword = true;  

  programs.firefox.enable = true;
}

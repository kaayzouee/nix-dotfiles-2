# modules/hardware/inputmethod.nix
{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
  };

  services.fcitx5-lotus = {
    enable = true;
    users = [ "kay" ];   # starts fcitx5-lotus-server@kay.service
  };
}

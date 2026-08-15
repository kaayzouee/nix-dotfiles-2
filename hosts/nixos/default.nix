{ pkgs, ... }:

let
  # Import package lists (simple lists, not NixOS modules)
  PKG_prolangs         = import ../../packages/PKG-prolangs.nix        { inherit pkgs; };
  PKG_editors          = import ../../packages/PKG-editors.nix         { inherit pkgs; };
  PKG_UtilitiesCLI     = import ../../packages/PKG-UtilitiesCLItools.nix { inherit pkgs; };
  PKG_systemnetworking = import ../../packages/PKG-systemnetworking.nix { inherit pkgs; };
  PKG_vpn              = import ../../packages/PKG-vpn.nix             { inherit pkgs; };
  PKG_multimedia       = import ../../packages/PKG-multimedia.nix      { inherit pkgs; };
  PKG_WMnoti           = import ../../packages/PKG-WMnoti.nix          { inherit pkgs; };
  PKG_themes          = import ../../packages/PKG-themes.nix          { inherit pkgs; };
  PKG_VM              = import ../../packages/PKG-VM.nix              { inherit pkgs; };
  PKG_ricing          = import ../../packages/PKG-forricing.nix       { inherit pkgs; };
in
{
  imports = [
    ../../hardware-configuration.nix

    ../../modules/boot.nix
    ../../modules/bluetooth.nix
    ../../modules/mice.nix
    ../../modules/desktop-xfce.nix
    ../../modules/fonts.nix
    ../../modules/inputmethod.nix
    ../../modules/networking.nix
    ../../modules/sound.nix
    ../../modules/users.nix
    ../../modules/virtualization.nix

  ];

  networking.hostName = "nixos";

  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Bangkok";

  system.stateVersion = "26.05";

environment.systemPackages =
     PKG_prolangs
  ++ PKG_editors
  ++ PKG_UtilitiesCLI
  ++ PKG_systemnetworking
  ++ PKG_vpn
  ++ PKG_multimedia
  ++ PKG_WMnoti
  ++ PKG_themes
  ++ PKG_VM
  ++ PKG_ricing;

}

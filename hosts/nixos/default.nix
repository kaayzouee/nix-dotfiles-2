{ pkgs, ... }:

let
  PKG_prolangs         = import ../../packages/PKG-prolangs.nix            { inherit pkgs; };
  PKG_editors          = import ../../packages/PKG-editors.nix             { inherit pkgs; };
  PKG_UtilitiesCLI     = import ../../packages/PKG-UtilitiesCLItools.nix   { inherit pkgs; };
  PKG_systemnetworking = import ../../packages/PKG-systemnetworking.nix   { inherit pkgs; };
  PKG_vpn              = import ../../packages/PKG-vpn.nix                 { inherit pkgs; };
  PKG_multimedia       = import ../../packages/PKG-multimedia.nix          { inherit pkgs; };
  PKG_WMnoti           = import ../../packages/PKG-WMnoti.nix              { inherit pkgs; };
  PKG_themes           = import ../../packages/PKG-themes.nix              { inherit pkgs; };
  PKG_VM               = import ../../packages/PKG-VM.nix                  { inherit pkgs; };
  PKG_ricing           = import ../../packages/PKG-forricing.nix           { inherit pkgs; };
in
{
  imports = [
    ../../hardware-configuration.nix

    ../../modules/desktop/desktop-xfce.nix

    ../../modules/hardware/fonts.nix
    ../../modules/hardware/inputmethod.nix
    ../../modules/hardware/mice.nix

    ../../modules/system/networking.nix
    ../../modules/system/boot.nix
    ../../modules/system/sound.nix
    ../../modules/system/users.nix
    ../../modules/system/virtualization.nix
    ../../modules/system/bluetooth.nix

    ../../modules/programs/vscode.nix
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

  system.stateVersion = "26.05";
}

{ pkgs, ... }:

let
  PKG_prolangs         = import ../../packages/PKG-prolangs.nix            { inherit pkgs; };
  PKG_editors          = import ../../packages/PKG-editors.nix             { inherit pkgs; };
  PKG_systemnetworking = import ../../packages/PKG-systemnetworking.nix    { inherit pkgs; };
  PKG_vpn              = import ../../packages/PKG-vpn.nix                 { inherit pkgs; };
  PKG_multimedia       = import ../../packages/PKG-multimedia.nix          { inherit pkgs; };
  PKG_WMnoti           = import ../../packages/PKG-WMnoti.nix              { inherit pkgs; };
  PKG_themes           = import ../../packages/PKG-themes.nix              { inherit pkgs; };
  PKG_VM               = import ../../packages/PKG-VM.nix                  { inherit pkgs; };
  PKG_ricing           = import ../../packages/PKG-forricing.nix           { inherit pkgs; };
  PKG_keygen           = import ../../packages/PKG-keygen.nix              { inherit pkgs; };
  PKG_cli_shg          = import ../../packages/cli-tools/PKG-CLI-shg.nix   { inherit pkgs; };
# ------ CLI ------
  PKG_cli_compression          = import ../../packages/cli-tools/PKG-CLI-compression.nix         { inherit pkgs; };
  PKG_cli_file_listing         = import ../../packages/cli-tools/PKG-CLI-file-listing.nix        { inherit pkgs; };
  PKG_cli_file_search          = import ../../packages/cli-tools/PKG-CLI-file-search.nix         { inherit pkgs; };
  PKG_cli_git                  = import ../../packages/cli-tools/PKG-CLI-git.nix                 { inherit pkgs; };
  PKG_cli_monitoring           = import ../../packages/cli-tools/PKG-CLI-monitoring.nix          { inherit pkgs; };
  PKG_cli_networking           = import ../../packages/cli-tools/PKG-CLI-networking.nix          { inherit pkgs; };
  PKG_cli_terminal_multiplexers= import ../../packages/cli-tools/PKG-CLI-terminal-multiplexers.nix { inherit pkgs; };
  PKG_cli_terminal_others      = import ../../packages/cli-tools/PKG-CLI-terminal-others.nix     { inherit pkgs; };
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
    ../../modules/programs/pcscd.nix
    ../../modules/programs/git.nix
  ];

  networking.hostName = "nixos";

  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    settings.auto-optimise-store = true;
    };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Bangkok";

  environment.systemPackages =
       PKG_prolangs
    ++ PKG_editors

    ++ PKG_cli_compression
    ++ PKG_cli_file_listing
    ++ PKG_cli_file_search
    ++ PKG_cli_git
    ++ PKG_cli_monitoring
    ++ PKG_cli_networking
    ++ PKG_cli_terminal_multiplexers
    ++ PKG_cli_terminal_others

    ++ PKG_systemnetworking
    ++ PKG_vpn
    ++ PKG_multimedia
    ++ PKG_WMnoti
    ++ PKG_themes
    ++ PKG_VM
    ++ PKG_ricing
    ++ PKG_keygen
    ++ PKG_cli_shg;
  system.stateVersion = "26.05";
}

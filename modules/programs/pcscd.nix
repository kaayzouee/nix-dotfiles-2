{ pkgs, ... }:

{
  services.pcscd.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
     pinentryPackage = pkgs.pinentry-curses;  # ← NEW WAY
  };
}

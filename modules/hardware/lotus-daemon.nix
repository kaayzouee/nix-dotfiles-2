# modules/hardware/lotus-daemon.nix
{ pkgs, ... }:
{
  # Ensure the systemd service is available
  systemd.packages = [ pkgs.fcitx5-lotus ];

  # Enable and start the service for your user (kay)
  systemd.services."fcitx5-lotus-server@kay" = {
    wantedBy = [ "multi-user.target" ];
    # The "overrideStrategy" is not strictly necessary here,
    # but it doesn't hurt to keep it if you had it before.
    # overrideStrategy = "asDropin";
  };
}

{
  virtualisation.libvirtd = {
    enable = true;

    # Do not run the QEMU process as root.
    qemu.runAsRoot = false;

    # Re-enable libvirt's QEMU isolation mechanisms.
    qemu.verbatimConfig = ''
      namespaces = [ "mount" ]
      seccomp_sandbox = 1
    '';

    # Never automatically resurrect an analysis VM after reboot.
    onBoot = "ignore";
  };

  programs.virt-manager.enable = true;

  # Useful additional MAC confinement layer on Linux.
  security.apparmor.enable = true;
}

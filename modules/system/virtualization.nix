{
  virtualisation.libvirtd = {
    enable = true;

    qemu.runAsRoot = false;

    qemu.verbatimConfig = ''
      seccomp_sandbox = 1
    '';

    onBoot = "ignore";
  };

  programs.virt-manager.enable = true;

  security.apparmor.enable = true;
}

# Import this module on a NixOS host to manage Windows (or other) VMs with libvirt.
# USB readers are attached to individual guests through virt-manager, not
# assigned globally to every VM.
{ ... }:
{
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true; # TPM 2.0 for Windows 11
  virtualisation.spiceUSBRedirection.enable = true; # optional USB hotplug via SPICE

  programs.virt-manager.enable = true;
}

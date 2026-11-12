# QEMU/KVM Windows VM with a USB smart-card reader

Add `./modules/qemu-kvm.nix` to the desired host's `modules` list in `flake.nix` (adjust the relative path if needed). Give the desktop user libvirt access in that host's NixOS configuration:

```nix
users.users.mcallen.extraGroups = [ "libvirtd" ];
```

NixOS merges `extraGroups` with other module definitions. Rebuild with `sudo nixos-rebuild switch --flake .#<host>`, then log out and back in for group membership to take effect.

Open `virt-manager` and connect to **QEMU/KVM (system)** (`qemu:///system`). Create a Windows VM using UEFI firmware and, for Windows 11, add a TPM 2.0 device (swtpm is enabled by the module). Use virtio drivers for better disk/network performance if needed.

To pass the reader to Windows: plug it in, identify it with `lsusb`, shut down the VM, open its details in virt-manager and select **Add Hardware → USB Host Device → your smart-card reader**. Start the VM and install its Windows driver if necessary. This attaches the physical reader to that VM; the host cannot use it concurrently. If `pcscd` or other host applications are using the reader, stop them or close them before attaching. On this repository's `raikou` host, `services.pcscd.enable` is already set, so host CAC functionality may conflict with guest ownership. Reconnecting the device may require reattaching it in virt-manager.

Alternatively, SPICE USB redirection is enabled for on-demand forwarding from a local graphical session; choose **Virtual Machine → Redirect USB device** in the SPICE viewer. Prefer **USB Host Device** for a reader that should stay assigned to the guest. No USB vendor/product ID is hard-coded in this module, since the reader model isn't known.

Hardware virtualization must be enabled in BIOS/UEFI; check with `ls /dev/kvm`. Windows installation media and a suitable license are separate requirements.

terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.116.1"
    }
  }
}

provider "proxmox" {
  # Any reachable API endpoint in the Proxmox cluster can manage all its nodes.
  endpoint = "https://192.168.1.91:8006/"
  # Only use this with a self-signed certificate you trust on your LAN.
  insecure = true
  # Export PROXMOX_VE_API_TOKEN; do not put the token in Terraform files.
}

resource "proxmox_virtual_environment_vm" "vm" {
  for_each = var.vms

  name       = each.key
  node_name  = each.value.node_name
  vm_id      = each.value.vm_id
  started    = true
  boot_order = ["scsi0", "ide2"]

  cpu {
    cores = 4
  }

  memory {
    dedicated = 6000
  }

  disk {
    datastore_id = each.value.disk_datastore_id
    interface    = "scsi0"
    size         = each.value.disk_size_gb
  }

  cdrom {
    interface = "ide2"
    file_id   = each.value.iso_file_id
  }

  network_device {
    bridge = each.value.bridge
  }
}


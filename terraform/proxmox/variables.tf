variable "vms" {
  description = "VMs to create; node_name is the Proxmox node name, not its IP address."
  type = map(object({
    node_name         = string
    vm_id             = number
    disk_datastore_id = string
    disk_size_gb      = number
    iso_file_id       = string
    bridge            = string
  }))
}

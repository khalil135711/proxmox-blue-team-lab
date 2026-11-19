output "vm_ids" {
  description = "Erstellte VMs und ihre IDs"
  value       = { for name, vm in proxmox_virtual_environment_vm.lab : name => vm.vm_id }
}

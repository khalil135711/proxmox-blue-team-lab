provider "proxmox" {
  endpoint  = var.pm_endpoint
  api_token = var.pm_api_token
  insecure  = var.pm_insecure

  ssh {
    agent    = true
    username = "root"
  }
}

# Alle Lab-VMs werden aus Templates geklont (siehe var.vms)
resource "proxmox_virtual_environment_vm" "lab" {
  for_each = var.vms

  name      = each.key
  node_name = var.node
  vm_id     = each.value.vmid
  tags      = each.value.tags

  clone {
    vm_id = each.value.template_id
  }

  cpu {
    cores = each.value.cores
    type  = "host"
  }

  memory {
    dedicated = each.value.memory
  }

  network_device {
    bridge  = var.bridge
    vlan_id = each.value.vlan
  }

  agent {
    enabled = true
  }

  lifecycle {
    ignore_changes = [clone]
  }
}

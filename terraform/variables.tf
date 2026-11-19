variable "pm_endpoint" {
  type        = string
  description = "Proxmox API URL, z. B. https://pve.lab.local:8006/"
}

variable "pm_api_token" {
  type        = string
  sensitive   = true
  description = "API-Token im Format user@realm!tokenid=secret"
}

variable "pm_insecure" {
  type        = bool
  default     = true
  description = "TLS-Pruefung ueberspringen (selbstsigniertes Zertifikat im Homelab)"
}

variable "node" {
  type        = string
  default     = "pve"
  description = "Name des Proxmox-Nodes"
}

variable "bridge" {
  type        = string
  default     = "vmbr1"
  description = "VLAN-aware Bridge fuer das Lab"
}

variable "vms" {
  description = "Lab-VMs: Name => Konfiguration"
  type = map(object({
    vmid        = number
    template_id = number
    cores       = number
    memory      = number # MB
    vlan        = number
    tags        = list(string)
  }))
}

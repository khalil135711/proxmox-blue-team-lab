# Lab-Setup

## 1. Proxmox vorbereiten
- VLAN-aware Bridge `vmbr1` anlegen (Bridge VLAN aware = an)
- API-Token für Terraform erstellen (Datacenter -> Permissions -> API Tokens)

## 2. Templates erstellen
| ID | Template |
|---|---|
| 9000 | Ubuntu Server (cloud-init) |
| 9100 | Windows Server (Sysprep) |
| 9101 | Windows 10/11 |
| 9200 | Kali Linux |

## 3. OPNsense
- Manuell als VM installieren, VLAN-Interfaces anlegen, Suricata aktivieren
- Suricata-EVE-Logs per Syslog an Wazuh weiterleiten

## 4. Windows-Agents
- Wazuh-Agent per MSI installieren (oder über GPO), Sysmon optional ergänzen

## 5. Snapshots
- Nach dem Grundsetup Snapshot `clean-baseline` pro VM, vor jedem Szenario zurücksetzen

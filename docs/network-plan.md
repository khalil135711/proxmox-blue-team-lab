# Netzwerkplan

| VLAN | Zone | Subnetz | Inhalt |
|---|---|---|---|
| 10 | Management | 10.10.10.0/24 | Wazuh, Proxmox-Management |
| 20 | Server / DMZ | 10.10.20.0/24 | dc01, web01 |
| 30 | Clients | 10.10.30.0/24 | Windows-Client |
| 66 | Attacker | 10.10.66.0/24 | Kali |

## Firewall-Regeln (OPNsense) – Grundidee
- Attacker -> Server/Clients: erlaubt (Angriffe, mit Suricata-Inspektion)
- Alle Zonen -> Wazuh (1514/1515 TCP): erlaubt (Agent-Kommunikation)
- Lab -> Internet: nur gezielt (Updates), Attacker-Zone ohne Internet
- Lab -> Heimnetz: komplett blockiert

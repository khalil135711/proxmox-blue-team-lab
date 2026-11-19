# Szenario 01 – SSH Brute Force

| | |
|---|---|
| **ATT&CK** | T1110.001 – Password Guessing |
| **Angreifer** | Kali (VLAN 66) |
| **Ziel** | web01 (VLAN 20) |
| **Erwartete Detection** | Wazuh-Regel 100110 |

## 1. Angriff
```bash
hydra -l testuser -P /usr/share/wordlists/rockyou.txt ssh://<web01-ip> -t 4
```

## 2. Erwartete Logs
- `/var/log/auth.log` auf web01 (Failed password …)
- Wazuh-Alert Regel 5760 -> 100110

## 3. Detection prüfen
- Wazuh Dashboard -> Threat Hunting -> Events, Filter `rule.id: 100110`

## 4. Response
- Quell-IP auf der OPNsense blocken
- SSH auf Key-Login umstellen, Fail2ban aktivieren

## 5. Ergebnis
- [ ] Alert ausgelöst (Screenshot in `reports/`)
- [ ] Report geschrieben

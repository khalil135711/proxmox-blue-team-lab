# Szenario 02 – Kerberoasting

| | |
|---|---|
| **ATT&CK** | T1558.003 – Kerberoasting |
| **Angreifer** | Kali oder Windows-Client mit Domain-User |
| **Ziel** | dc01 (Active Directory) |
| **Erwartete Detection** | Wazuh-Regel 100100 / Sigma `kerberoasting_rc4_tgs.yml` |

## Vorbereitung
- Service-Account mit SPN anlegen (z. B. `svc-sql` mit `MSSQLSvc/db01.lab.local`)
- Auditing aktivieren: *Audit Kerberos Service Ticket Operations* (Erfolg)
- Wazuh-Agent auf dc01, Security-Eventchannel aktiv

## 1. Angriff
```bash
impacket-GetUserSPNs lab.local/<user>:<pass> -dc-ip <dc01-ip> -request
```

## 2. Erwartete Logs
- Windows Event 4769, TicketEncryptionType 0x17

## 3. Detection prüfen
- Wazuh: `rule.id: 100100`

## 4. Response
- Passwort des Service-Accounts rotieren (lang, zufällig) oder gMSA nutzen
- AES-Verschlüsselung erzwingen, RC4 deaktivieren

## 5. Ergebnis
- [ ] Alert ausgelöst
- [ ] Report geschrieben

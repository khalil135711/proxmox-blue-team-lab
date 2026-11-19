# Hardening-Checkliste (Proxmox Host)

- [ ] 2FA für den Proxmox-Login (TOTP)
- [ ] Root-Login per SSH deaktiviert, nur Key-Authentifizierung
- [ ] Proxmox-Firewall aktiv, Management-Interface eingeschränkt
- [ ] Regelmäßige Updates (`apt update && apt full-upgrade`)
- [ ] Backups über Proxmox Backup Server
- [ ] Lab-Netz vom Heimnetz getrennt

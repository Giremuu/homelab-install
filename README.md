# Mon Homelab

Documentation complète de mon homelab privé.

> **Disclaimer de sécurité**
> - Ce repository est **PUBLIC** et sert uniquement de documentation
> - Les IPs, domaines et informations jugées sensibles ont été **anonymisés**
> - **Zéro exposition Internet**

---

## Vue d'ensemble

### Objectifs du projet

- Héberger des services personnels de manière privée et sécurisée
- Pratiquer Docker et Proxmox
- Centraliser mes outils et services que j'utilise au quotidien
- Zéro exposition sur Internet (Pas le besoin vis-à-vis de ma situation)

### Principes de conception

- **Sécurité first** : Aucun service exposé publiquement, ports par défaut modifiés, mots de passe lourds, identifiants modifiés...
- **Accès via VPN uniquement** : VPN privé et chiffré entre mes appareils et mes VM
- **Infrastructure as Code** : Docker Compose pour tout les services
- **Monitoring complet** : Uptime Kuma pour la partie alerting

---

## Déploiement

Je ne rentre pas dans le détail de l'installation ou des configurations des services mais ils sont tous déployés via Docker Compose avec :
- Variables d'environnement externalisées
- Volumes persistants pour les données
- Restart policies configurées
Les fichiers docker-compose.yml seront publiés mais anonymisés

---

## Infrastructure

### Architecture

![Schema Infra](image/schema-infra-homelab.png)

### Outils & Services

**Proxmox VE - Hyperviseur**

**Machine virtuelle :**
- **OS** : Debian 13 (Bookworm)
- **RAM** : 16 Go
- **vCPU** : 6 cœurs
- **Stockage** : 150 Go
- **Réseau** : Bridge Proxmox + VPN

**NAS - Synology**

**Homarr :** Dashboard central personnalisable avec widgets pour centraliser l'accès à mes interfaces Web

![Image Homarr](image/Homarr_screen.png)

**Portainer :** Similaire à Docker Desktop, Portainer me permet de gérer mes conteneurs Docker

**Vaultwarden :** Gestionnaire de mots de passe hébergé

**NocoDB :** Tableur Excel-Like pour la gestion de mes budgets personnels

**n8n :** Plateforme d'automatisation (Comme Zapier)

**Navidrome :** Serveur de streaming musical

**Uptime Kuma :** Supervision légère et alerting

**Dash. :** Dashboard des statistiques système

**PiHole :** Blocage de publicités au niveau DNS


## Supervision

### Configuration Uptime Kuma :

**J'ai configuré plusieurs monitors :**

#### Services critiques 🔴

| Service | Type | Cible | Intervalle | Alerte si |
|---------|------|-------|------------|-----------|
| **Vaultwarden** | HTTP(s) (Ignore SSL) | `https://X.x.x.x:XXXX` | 5 min | Down > 15 min |
| **NAS Synology** | Ping | `X.x.x.x` (NAS) | 5 min | 3 échecs consécutifs |

#### Services importants 🟡

| Service | Type | Cible | Intervalle | Alerte si |
|---------|------|-------|------------|-----------|
| **Homarr** | HTTP(s) | `http://x.x.x.x:XXXX` | 10 min | Down >30 min |
| **Portainer** | HTTP(s) | `http://x.x.x.x:XXXX` | 10 min | Down >30 min |
| **n8n** | HTTP(s) | `http://x.x.x.x:XXXX` | 15 min | Down >30 min |

#### Services confort 🟢

| Service | Type | Cible | Intervalle | Alerte si |
|---------|------|-------|------------|-----------|
| **Navidrome** | HTTP(s) | `http://x.x.x.x:XXXX` | 15 min | Down >1h |
| **NocoDB** | HTTP(s) | `http://x.x.x.x:XXXX` | 15 min | Down >1h |
| **Internet** | Ping | `1.1.1.1` | 10 min | Info (pas critique) |

![Image Uptime Kuma](image/UpTimeKuma_screen.png)


### Notifications

**Webhook configuré :** Discord pour recevoir les alertes sur un serveur personel

---

## Ressources et liens utiles

### Documentation officielle

- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Proxmox Documentation](https://pve.proxmox.com/pve-docs/)

### Services

- [Homarr](https://homarr.dev/)
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)
- [Uptime Kuma](https://github.com/louislam/uptime-kuma)
- [Uptime Kuma - Slash-Root](https://slash-root.fr/421/)
- [Portainer](https://www.portainer.io/)
- [n8n](https://n8n.io/)
- [Navidrome](https://www.navidrome.org/)
- [NocoDB](https://www.nocodb.com/)
- [PiHole](https://pi-hole.net/)

---

## Statistiques du projet

**Date de création :** Octobre 2024
**Temps d'installation total :** ~8 heures (apprentissage inclus) pour l'installation (Dont 7h pour ce ReadME)
**Utilisation ressources :**
- RAM : ~4 Go / 8 Go
- CPU : <20% en moyenne
- Stockage : ~30 Go / 150 Go

---

## Prochaines améliorations envisagées

### Court terme
- [ ] Créer des workflows n8n
- [ ] Automatiser le déploiement du Homelab via Ansible (CF : Autre projet)

### Moyen terme
- [ ] Mettre en place backups automatiques réguliers
- [ ] Explorer d'autres services
- [ ] Tester des outils dans des environnements isolés

### Long terme
- [ ] Upgrade RAM à 12-16 Go si nécessaire
- [ ] Ajouter une deuxième VM pour redondance
- [ ] Home Assistant si achat objets connectés

---

## Feedback & Contact

Ce homelab est un projet d'apprentissage en plus d'être utile au quotidien. Si vous avez :
- Des suggestions d'amélioration
- Des retours sur l'architecture
- Des questions sur la configuration
- Des idées de services à partager

N'hésitez pas à ouvrir une **issue** ou une **discussion** sur ce repo !


*Dernière mise à jour : Novembre 2025*

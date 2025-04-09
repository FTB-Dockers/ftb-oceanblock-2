# 🧱 FTB OceanBlock Server - Docker Image

A pre-installed, plug-and-play [Feed The Beast (FTB)](https://feed-the-beast.com/) modded Minecraft server based on the **OceanBlock 2** modpack.  
Built for Docker, runs anywhere — including **Unraid**, **Docker Compose**, and plain `docker run`.

---

## 🎯 Features

- ✅ Based on **OceanBlock 2** (modpack ID `128`, version `100059`)
- ✅ Pre-installed server files — no download delay
- ✅ Supports Java 21 via `openjdk:21-jdk-slim`
- ✅ Fully configurable via environment variables
- ✅ Persists world/config/mods in `/data`
- ✅ Works on **Unraid** with included XML template and icon
- ✅ Docker Hub–ready image with version tagging

---

## 🐳 Quick Start (Docker)

```bash
docker run -d \
  --name ftb-oceanblock-2 \
  -p 25565:25565 \
  -e EULA=true \
  -e MEMORY=6G \
  -v /your/local/folder:/data \
  tr0mb4s/ftb-oceanblock-2:latest
```

---

## 🧩 Docker Compose

```yaml
version: "3"

services:
  ftbserver:
    image: yourdockerhubuser/ftb-oceanblock:1.0.0
    container_name: ftb-oceanblock
    environment:
      EULA: "true"
      MEMORY: "6G"
    ports:
      - "25565:25565"
    volumes:
      - ./world:/data
    restart: unless-stopped
```

---

## ⚙️ Environment Variables

| Variable     | Description                             | Example |
|--------------|-----------------------------------------|---------|
| `EULA`       | Must be `true` to accept Minecraft EULA | `true`  |
| `MEMORY`     | Maximum Java heap memory                | `6G`    |
| `JVM_OPTS`   | Additional Java options (optional)      | `-XX:+UseG1GC` |

---

## 💾 Data Persistence

Everything important is stored in `/data`:
- `world/`
- `mods/`
- `config/`
- `eula.txt`, `logs/`, etc.

Mount a volume or folder to `/data` to keep your world between updates.

---

## 🖥️ Unraid Support

- `template/ftb-oceanblock-2.xml` is included for Unraid Docker GUI
- Custom icon available in `unraid-icon.png` (128x128 PNG)
- Copy or link to the XML in `/boot/config/plugins/dockerMan/templates-user/`

---

## 🛠️ Build From Source

```bash
docker build -t tr0mb4s/ftb-oceanblock-2:latest .
```

---

## 📦 Tags

- `1.7.0` – OceanBlock 2 128/100059, pre-installed
- `latest` – optional tag alias
- More packs coming soon...

---

## 📜 License

MIT — free to use, build, and modify.

---

## 🧠 Credits

- Based on [FTB OceanBlock](https://feed-the-beast.com/modpacks/128-oceanblock)
- Powered by [Docker](https://www.docker.com/)
- Built for server admins, hobbyists, and Unraid enthusiasts

---

## 💬 Questions or Suggestions?

Feel free to open an issue or contribute via pull request!

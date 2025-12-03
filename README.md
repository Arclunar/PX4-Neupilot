<div align="center">

# 🚁 PX4-NeuPilot

**PX4-Autopilot for Neural Control**

[![PX4](https://img.shields.io/badge/PX4-Autopilot-orange?style=for-the-badge&logo=drone)](https://px4.io/)
[![ROS2](https://img.shields.io/badge/ROS2-Humble-blue?style=for-the-badge&logo=ros)](https://docs.ros.org/en/humble/)
[![Gazebo](https://img.shields.io/badge/Gazebo-Harmonic-green?style=for-the-badge)](https://gazebosim.org/)
[![License](https://img.shields.io/badge/License-BSD--3-yellow?style=for-the-badge)](LICENSE)

*A neural control-enhanced PX4 autopilot system with integrated Gazebo Harmonic simulation*

[Features](#-features) • [Quick Start](#-quick-start) • [Development](#-development-guide) • [Documentation](#-documentation)

---

</div>

## ✨ Features

- 🎯 **Neural Control Integration** - Enhanced PX4 with neural network capabilities
- 🐳 **Docker Support** - Pre-configured development and production environments
- 🎮 **Gazebo Harmonic** - Modern physics simulation with GPU acceleration
- 🤖 **ROS 2 Humble** - Seamless integration with ROS 2 ecosystem
- 🔧 **Hot Reload** - Development mode with live code updates
- ⚡ **Just Commands** - Simplified workflow with `just` command runner

---

## 🚀 Quick Start

### Prerequisites

- Docker with GPU support (NVIDIA)
- [Just](https://github.com/casey/just) command runner
- Git

### 📦 Clone the Repository

```bash
git clone https://github.com/Arclunar/PX4-Neupilot.git --recursive --depth 1
cd PX4-Neupilot
```

### 🎯 Deploy with Docker

<details>
<summary><b>0. Configure Proxy (Optional, for users in China)</b></summary>

See [Docker proxy documentation](https://docs.docker.com/engine/cli/proxy/). Modify `~/.docker/config.json`:

```json
{
  "proxies": {
    "default": {
      "httpProxy": "http://127.0.0.1:7890",
      "httpsProxy": "http://127.0.0.1:7890",
      "noProxy": "localhost,127.0.0.1,.daocloud.io"
    }
  }
}
```

</details>

#### 1️⃣ Build the Docker Image

```bash
just build-px4
```

#### 2️⃣ Run the Container

```bash
just run-px4
```

#### 3️⃣ Start the Simulation

Inside the container, launch a quadrotor simulation with Micro-XRCE-DDS agent:

```bash
runsim.sh 2
```

### 🔗 ROS 2 Integration

For ROS 2 communication and examples, see:
👉 [PX4-ROS2-Bridge](https://github.com/Arclunar/PX4-ROS2-Bridge/tree/main#)

---

## 🛠️ Development Guide

> **For active development with live code reloading**

### Setup Development Environment

The development container mounts your local workspace for instant code updates without rebuilding.

#### 1️⃣ Build Development Image

```bash
just build-dev
```

This builds from `docker/px4-gazebo-dev.dockerfile` .
#### 2️⃣ Run Development Container

```bash
just run-dev
```


#### 3️⃣ Enter the Container

```bash
just enter-dev
```

Or manually:
```bash
docker exec -it --user px4 px4-gazebo-harmonic-dev /bin/bash
```

#### 4️⃣ Build PX4

Inside the container:
```bash
just make
# or
make px4_sitl_default
```

### 🔧 Available Commands

| Command | Description |
|---------|-------------|
| `just build-px4` | Build production Docker image |
| `just run-px4` | Run production container (ephemeral) |
| `just enter-px4` | Enter running production container |
| `just build-dev` | Build development Docker image |
| `just run-dev` | Run development container with volume mount |
| `just enter-dev` | Enter development container |
| `just make` | Build PX4 (inside container) |
| `just clean-image` | Remove Docker images |
| `just clean-px4` | Remove containers |
| `just clean-dev` | Remove development image |
| `just df-docker` | Check Docker disk usage |

### 💡 Development Tips

- ✅ **Live Updates**: Code changes are immediately available (no rebuild needed)
- ✅ **Persistent State**: Container persists across restarts
- ✅ **Detach Mode**: Use `Ctrl-P` + `Ctrl-Q` to detach without stopping
- ⚠️ **Dependencies**: Rebuild image only when updating system packages
- 💾 **Git Safe**: Workspace is automatically configured as safe directory

### 🐛 Troubleshooting

<details>
<summary><b>Container exits immediately</b></summary>

Use `Ctrl-P` + `Ctrl-Q` to detach instead of `exit`. Or run with `-d` flag for background mode.

</details>

<details>
<summary><b>Permission denied errors</b></summary>

The `px4` user in the container should match your host UID (1000). Check with:
```bash
id -u  # On host
```

</details>

<details>
<summary><b>GPU not working in Gazebo</b></summary>

Ensure NVIDIA Docker runtime is installed:
```bash
docker info | grep -i runtime
```

</details>

---

## 📚 Documentation

- 📖 [PX4 User Guide](https://docs.px4.io/)
- 🔧 [PX4 Developer Guide](https://dev.px4.io/)
- 🤖 [ROS 2 Humble Docs](https://docs.ros.org/en/humble/)
- 🎮 [Gazebo Harmonic Docs](https://gazebosim.org/docs/harmonic)

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---
---

<div align="center">

### 🌟 If this project helps you, please give it a ⭐ Star!

**Made with ❤️ by [Arclunar](https://github.com/Arclunar)**

[⬆ Back to Top](#-px4-neupilot)

</div>

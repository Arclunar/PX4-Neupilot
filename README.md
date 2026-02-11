<div align="center">

# 🚁 PX4-NeuPilot

**PX4-Autopilot for Neural Control**

[![PX4](https://img.shields.io/badge/PX4-Autopilot-orange?style=for-the-badge&logo=drone)](https://px4.io/)
[![ROS2](https://img.shields.io/badge/ROS2-Humble-blue?style=for-the-badge&logo=ros)](https://docs.ros.org/en/humble/)
[![Gazebo](https://img.shields.io/badge/Gazebo-Harmonic-green?style=for-the-badge)](https://gazebosim.org/)
[![License](https://img.shields.io/badge/License-BSD--3-yellow?style=for-the-badge)](LICENSE)

*A neural control-enhanced PX4 autopilot system with integrated Gazebo Harmonic simulation*

[Quick Start](#-quick-start) • [Documentation](#-documentation)

---

</div>





## 🚀 Quick Start

### Prerequisites

- Docker with GPU support (NVIDIA)
- [Just](https://github.com/casey/just) command runner
- Git

### 📦 Clone the Repository

```bash
git clone https://github.com/WarriorHanamy/PX4-Neupilot.git --recursive --depth 1
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

---

## 👥 Contributors

- [WarriorHanamy](https://github.com/WarriorHanamy) - Maintainer
- [Arclunar](https://github.com/Arclunar) (H.W. ZHENG) - Original author

---

## 📚 Documentation

- 📖 [PX4 User Guide](https://docs.px4.io/)
- 🔧 [PX4 Developer Guide](https://dev.px4.io/)
- 🤖 [ROS 2 Humble Docs](https://docs.ros.org/en/humble/)
- 🎮 [Gazebo Harmonic Docs](https://gazebosim.org/docs/harmonic)



<div align="center">

### 🌟 If this project helps you, please give it a ⭐ Star!

**Made with ❤️ by [WarriorHanamy](https://github.com/WarriorHanamy)**

[⬆ Back to Top](#-px4-neupilot)

</div>

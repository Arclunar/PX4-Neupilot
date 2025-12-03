<div align="center">

# PX4-NeuPilot

**PX4-Autopilot for Neural Contorl**


[![PX4](https://img.shields.io/badge/PX4-Autopilot-orange)](https://px4.io/)
[![License](https://img.shields.io/badge/License-BSD--3-green.svg)](LICENSE)

</div>

## Quick Start
### 📦 Clone the repo
```bash
git clone https://github.com/Arclunar/PX4-Neupilot.git --recursive --depth 1
```


### 🎯 Docker Deployment
#### 0. Adjust proxy settings
See https://docs.docker.com/engine/cli/proxy/, in china, you have to
modify the `~/.docker/config.json` file as in
```yaml
{
 "proxies": {
   "default": {
     "httpProxy": "http://proxy.example.com:3128", # e.g. http://127.0.0.1:7890
     "httpsProxy": "https://proxy.example.com:3129", # e.g. http://127.0.0.1:7890
     "noProxy": "*.test.example.com,.example.org,127.0.0.0/8" # e.g. "localhost,127.0.0.1,.daocloud.io"
   },
}
```

#### 1. Build the docker image
```bash
just build-px4
```

#### 2. Then run docker
```bash
just run-px4
```

#### 3. Start the simulation
In the docker terminal, run
```bash
runsim.sh 2
```
to start a gazebo simulation with a quadrotor , with Micro-XRCED-DDS agent running.

---
### For interact with ros2
see [PX4-ROS2-Bridge](https://github.com/Arclunar/PX4-ROS2-Bridge/tree/main#)


---
<div align="center">

**如果这个项目对你有帮助，请给一个 ⭐ Star！**

Made with ❤️ by Arclunar

</div>

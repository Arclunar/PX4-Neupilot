<div align="center">

# PX4-Neupilot

**PX4-Autopilot for Neural Contorl**


[![PX4](https://img.shields.io/badge/PX4-Autopilot-orange)](https://px4.io/)
[![License](https://img.shields.io/badge/License-BSD--3-green.svg)](LICENSE)

</div>

## Quick Start
### clone the repo
```bash
  git clone git@github.com:Arclunar/PX4-Neupilot.git --recursive --depth 1
```


### Docker
Build the docker image
```bash
  just build-image
```

Then run docker
```bash
  just run-container
```

In the docker terminal, run
```bash
  runsim.sh 2
```
to start a gazebo simulation with a quadrotor , with Micro-XRCED-DDS agent running.


<div align="center">

**如果这个项目对你有帮助，请给一个 ⭐ Star！**

Made with ❤️ by Arclunar

</div>

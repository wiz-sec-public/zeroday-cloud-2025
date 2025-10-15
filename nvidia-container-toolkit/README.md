# NVIDIA Container Toolkit

This document provides the official target information and testing environment for the NVIDIA Container Toolkit target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to perform a **container escape** and compromise the host machine from within a NVIDIA Container Toolkit container. 

To prove successful container escape and host compromise, the exploit must demonstrate one of the following:
- **Remote Code Execution (RCE)**: Execute the command `/flag.sh nct` on the host system
- **File Access**: Read the file `/flag` from the host system

**Note:** Linux Kernel exploits are not eligible for this target. Vulnerabilities in the NVIDIA drivers bundled with the Container Toolkit are in scope.

There are two exploitation scenarios:

### User Provided Image Scenario
In this scenario, contestants will provide their own container image. The image will be executed with the following command:
```bash
sudo docker run --rm --runtime=nvidia --gpus all <image>
```

### Arbitrary Image Scenario  
In this scenario, contestants will provide a shell script or binary. The participants will execute this payload within a running, standard container instance.

In both scenarios, the goal is to escape the container and compromise the host by either executing `/flag.sh nct` or reading `/flag` on the host machine.

---

## Local Testing Environment

On demo day, the environment will be Ubuntu 24.04 with Docker and the NVIDIA Container Toolkit installed from their official releases.
- NVIDIA Container Toolkit: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

To maximize your chances of success during the live demonstration, we strongly recommend testing your exploits in a similar environment.

---

For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io

# Docker

This document provides the official target information and testing environment for the Docker target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to perform a **container escape** and compromise the host machine from within a Docker container. 

To prove successful container escape and host compromise, the exploit must demonstrate one of the following:
- **Remote Code Execution (RCE)**: Execute the command `/flag.sh docker` on the host system
- **File Access**: Read the file `/flag` from the host system

**Note:** Kernel exploits are not eligible for this target.

There are two exploitation scenarios:

### User Provided Image Scenario
In this scenario, contestants will provide their own Docker image. The image will be executed with the command:
```bash
docker run --rm -it <image>
```

### Arbitrary Image Scenario  
In this scenario, contestants will provide a shell script or binary to execute within a container. The container will be executed with the command:
```bash
docker run --rm -it <image>
```

In both scenarios, the goal is to escape the container and demonstrate host compromise by either executing `/flag.sh docker` or reading `/flag` on the host machine.

---

## Local Testing Environment

On demo day, we will use Ubuntu 24.04 with Docker installed from the official installation script available at https://get.docker.com/

For the best chance of success during the live demonstration, we recommend testing your exploits in a similar environment (Ubuntu 24.04 with Docker installed using the official script).

---

For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
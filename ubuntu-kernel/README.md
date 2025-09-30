# Ubuntu Kernel

This document provides the official target information and testing environment for the Ubuntu Kernel target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to exploit a **0-day vulnerability in the Ubuntu kernel** to compromise the host machine from within a Docker container.

To prove successful kernel exploit and host compromise, the exploit must demonstrate:
- **Container Escape**: Execute the command `/flag.sh ubuntu` on the host system

### Vulnerability Requirements

The vulnerability must meet the following criteria:
- **0-day vulnerability**: The vulnerability must be previously unknown to both Ubuntu maintainers and the mainline Linux kernel maintainers
- **No existing patches**: If a patch is available for this vulnerability but has not yet been merged, the submission is not eligible
- **Kernel-level exploit**: The exploit must target the Linux kernel itself, not userspace applications or container runtime

### Exploitation Scenario

Contestants will provide their exploit (shell script, binary, or Docker image) which will be executed within a standard Docker container. The container will be executed with the command:
```bash
docker run --rm -it <image>
```

The goal is to exploit the kernel vulnerability from within the container to achieve host compromise by executing `/flag.sh ubuntu` on the host machine.

---

## Local Testing Environment

On demo day, we will use Ubuntu Server with the latest stable kernel and Docker installed from the official installation script available at https://get.docker.com/

For the best chance of success during the live demonstration, we recommend testing your exploits in a similar environment (Ubuntu Server with the latest stable kernel and Docker installed using the official script).

---

For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
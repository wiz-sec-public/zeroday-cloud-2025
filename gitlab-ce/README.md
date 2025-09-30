# GitLab-CE

This document provides the official target information and testing environment for the GitLab-CE target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to achieve **Remote Code Execution (RCE)**. The exploit must be triggered remotely by attacking the services exposed on ports **80 (HTTP)** and **443 (HTTPS)**.

To prove Remote Code Execution, the exploit must execute the command `/flag.sh gitlab` on the target system.

### Unauthenticated Scenario  
In this scenario, no credentials will be provided. Your exploit must work without any prior authentication to the GitLab-CE instance.

---

## Local Testing Environment

For your convenience, we have provided a Docker Compose setup that replicates the official competition environment. An exploit that functions correctly against this local setup is highly likely to succeed during the live demonstration.

To build and launch the local target environment, execute the following command from your terminal:

```bash
docker compose up
```

The GitLab-CE service will be accessible at `http://localhost:80`

**Note:** GitLab-CE may take several minutes to fully initialize after starting the container. Please wait for the service to be completely ready before testing your exploits.

---

For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
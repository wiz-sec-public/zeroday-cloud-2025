# GitLab-CE

This document provides the official target information and testing environment for the GitLab-CE target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to achieve **Remote Code Execution (RCE)**. The exploit must be triggered remotely by attacking the services exposed on ports **80 (HTTP)** and **443 (HTTPS)**.

To prove Remote Code Execution, the exploit must execute the command `/flag.sh gitlab` on the target system.

There are two exploitation scenarios:

### Authenticated Scenario
In this scenario, valid credentials for a low-privileged user will be provided to contestants. You may use these credentials to authenticate with the GitLab-CE instance before attempting your exploit. The user has standard developer permissions and can create repositories.

### Unauthenticated Scenario
In this scenario, no credentials will be provided. Your exploit must work without any prior authentication to the GitLab-CE instance.

---

## Local Testing Environment

For your convenience, we have provided a Docker Compose setup that replicates the official competition environment. An exploit that functions correctly against this local setup is highly likely to succeed during the live demonstration.

To build and launch the local target environment, execute the following command from your terminal:

```bash
docker compose up
```

For testing purposes, you can use the following credentials to access the GitLab-CE instance:
- **Root User:**
  - Username: `root`
  - Password: `zerodaycloud1!`
- **Developer User (Low-privileged):**
  - Username: `developer`
  - Password: `zerodaycloud1!`

The GitLab-CE service will be accessible at `http://localhost:80`

**Note:** GitLab-CE may take several minutes to fully initialize after starting the container. Please wait for the service to be completely ready before testing your exploits.

---

For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
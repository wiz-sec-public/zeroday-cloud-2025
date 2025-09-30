# Jenkins

This document provides the official target information and testing environment for the Jenkins target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to achieve **unauthenticated Remote Code Execution (RCE)** in the Jenkins Core. The exploit must be triggered remotely by attacking the service exposed on port **8080 (Web UI)** without requiring any credentials. **Vulnerabilities found in plugins are not eligible for scoring on this target**.

To prove Remote Code Execution, the exploit must execute the command `/flag.sh jenkins` on the target system.

---

## Local Testing Environment

For your convenience, we have provided a Docker Compose setup that replicates the official competition environment. Please ensure **no plugins are installed**. An exploit that functions correctly against this local setup is highly likely to succeed during the live demonstration.

To build and launch the local target environment, execute the following command from your terminal:

```bash
docker compose up
```

The Jenkins service will be accessible at:

* **Web UI**: http://localhost:8080

**Note:** The Jenkins instance is configured with authentication enabled to simulate a realistic scenario. For local testing purposes, you can use the following credentials:
- **Username:** `admin`
- **Password:** `zerodaycloud1!`

Remember, the objective is to achieve **unauthenticated RCE**, so these credentials should not be needed for your exploit.

---

For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
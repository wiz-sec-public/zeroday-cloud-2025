# ollama

This document provides the official target information and testing environment for the ollama target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to achieve **Remote Code Execution (RCE)**. The exploit must be triggered remotely by attacking the service exposed on port **11434** (Ollama API).

To prove Remote Code Execution, the exploit must execute the command `/flag.sh ollama` on the target system.

---

## Local Testing Environment

For your convenience, we have provided a Docker Compose setup that replicates the official competition environment. An exploit that functions correctly against this local setup is highly likely to succeed during the live demonstration.

To build and launch the local target environment, execute the following command from your terminal:

```bash
docker compose up
```

The ollama service will be accessible at:
- **API Endpoint:** `http://localhost:11434`

---

For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
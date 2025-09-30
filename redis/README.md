# Redis

This document provides the official target information and testing environment for the Redis target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to achieve **Remote Code Execution (RCE)**. The exploit must be triggered remotely by attacking the service exposed on port **6379 (Redis)**.

To prove Remote Code Execution, the exploit must execute the command `/flag.sh redis` on the target system.

There are two exploitation scenarios:

### Authenticated Scenario
In this scenario, valid credentials will be provided to contestants. You may use these credentials to authenticate with the Redis instance before attempting your exploit.

### Unauthenticated Scenario  
In this scenario, no credentials will be provided. Your exploit must work without any prior authentication to the Redis instance.

---

## Local Testing Environment

For your convenience, we have provided a Docker Compose setup that replicates the official competition environment. An exploit that functions correctly against this local setup is highly likely to succeed during the live demonstration.

To build and launch the local target environment, execute the following command from your terminal:

```bash
docker compose up
```

For testing purposes, you can use the following credentials to access the Redis instance:
- **Redis Password:** `zerodaycloud1!`

The Redis service will be accessible at `localhost:6379`

---

For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
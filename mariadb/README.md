# MariaDB

This document provides the official target information and testing environment for the MariaDB target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to achieve **Remote Code Execution (RCE)**. The exploit must be triggered remotely by attacking the service exposed on port **3306 (MariaDB)**.

To prove Remote Code Execution, the exploit must execute the command `/flag.sh mariadb` on the target system.

There are two exploitation scenarios:

### Authenticated Scenario
In this scenario, valid credentials will be provided to contestants. You may use these credentials to authenticate with the MariaDB instance before attempting your exploit. **Note: For this scenario, you must use the low privileged (non-superuser) `demo` account, not the root account.**

### Unauthenticated Scenario  
In this scenario, no credentials will be provided. Your exploit must work without any prior authentication to the MariaDB instance.

---

## Local Testing Environment

For your convenience, we have provided a Docker Compose setup that replicates the official competition environment. An exploit that functions correctly against this local setup is highly likely to succeed during the live demonstration.

To build and launch the local target environment, execute the following command from your terminal:

```bash
docker compose up
```

For testing purposes, you can use the following credentials to access the MariaDB instance:
- **Root Username:** `root`
- **Root Password:** `zerodaycloud1!`
- **Demo Username:** `demo`
- **Demo Password:** `zerodaycloud1!`
- **Database:** `demo`

The MariaDB service will be accessible at `localhost:3306`

---

For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
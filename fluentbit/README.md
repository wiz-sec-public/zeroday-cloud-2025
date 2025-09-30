# Fluent Bit

This document provides the official target information and testing environment for the Fluent Bit target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to achieve **Remote Code Execution (RCE)**. The exploit must be triggered remotely by attacking the service exposed on port **9880 (HTTP Input)** or **2020 (HTTP Monitoring)**.

To prove Remote Code Execution, the exploit must execute the command `/flag.sh fluentbit` on the target system.

---

## Local Testing Environment

For your convenience, we have provided a Docker Compose setup that replicates the official competition environment. An exploit that functions correctly against this local setup is highly likely to succeed during the live demonstration.

To build and launch the local target environment, execute the following command from your terminal:

```bash
docker compose up
```

The Fluent Bit service will be accessible at:
- **HTTP Input:** `http://localhost:9880`
- **HTTP Monitoring:** `http://localhost:2020`

### Testing the Service

You can test that Fluent Bit is running correctly by:

1. Sending a log message to the HTTP input:
```bash
curl -X POST -H 'Content-Type: application/json' \
  -d '{"key": "value", "message": "test log"}' \
  http://localhost:9880
```

2. Checking the monitoring endpoint:
```bash
curl http://localhost:2020/api/v1/health
```

---

For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
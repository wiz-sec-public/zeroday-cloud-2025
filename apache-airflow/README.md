# Apache Airflow

This document provides the official target information and testing environment for the Apache Airflow target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to achieve **Remote Code Execution (RCE)**. The exploit must be triggered remotely by attacking the exposed web service.

To prove Remote Code Execution, the exploit must execute the command `/flag.sh airflow` on the target system.

### Unauthenticated RCE Scenario  
In this scenario, authentication is enabled on the Apache Airflow instance. Your exploit must achieve Remote Code Execution without any prior authentication, making this a critical security vulnerability.

---

## Local Testing Environment

For your convenience, we have provided a Docker Compose setup that replicates the official competition environment. An exploit that functions correctly against this local setup is highly likely to succeed during the live demonstration.

Installation instructions can be found here: https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html

This testing environment is configured with Apache Airflow version 3.0.6, which is the current stable release at the time of this documentation. During the live competition, the latest version of Apache Airflow will be installed. To be eligible for this target, your exploit must work on the latest available version of Apache Airflow.

To build and launch the local target environment, execute the following command from your terminal:

```bash
docker compose up -d
```

The Apache Airflow service will be accessible at:
- **API Server**: `http://localhost:8081`
- **Login Page**: `http://localhost:8081/auth/login/`

**Authentication Credentials for Testing:**
- **Username:** `admin`
- **Password:** `zerodaycloud1!`

**Note:** 
- Apache Airflow may take several minutes to fully initialize after starting the container. Please wait for the service to be completely ready before testing your exploits.
- Authentication is enabled. The objective is to achieve unauthenticated RCE on this authenticated instance.

---

For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
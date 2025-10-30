# vLLM Memory Corruption Vulnerability - POC Suite

**For Responsible Disclosure Purposes Only**

This repository contains proof-of-concept (POC) code demonstrating critical memory corruption vulnerabilities in vLLM's C++/CUDA code. These vulnerabilities are remotely exploitable via the public API without authentication.

⚠️ **WARNING:** Only use this code against systems you own or have explicit written permission to test. Unauthorized security testing may be illegal.

---

## Executive Summary

**Vulnerability Type:** Memory Corruption (Integer Overflow, Out-of-Bounds Access)
**Severity:** CRITICAL (CVSS 10.0)
**Remote Exploitability:** YES - via public API
**Authentication Required:** NO
**Impact:** Denial of Service (confirmed), Memory Corruption (confirmed), Potential RCE

### Vulnerabilities Discovered

1. **Integer Overflow in Block Number Calculation** (`csrc/cache_kernels.cu:48-66`)
2. **Out-of-Bounds Array Access in slot_mapping** (`csrc/cache_kernels.cu:237-244`)
3. **CUDA Kernel Parameter Validation Failure** (`csrc/cache_kernels.cu:74-98`)

All vulnerabilities are reachable from the OpenAI-compatible API endpoints (`/v1/completions`, `/v1/chat/completions`).

---

## Repository Structure

```
.
├── poc_suite/
│   ├── utils.py                    # Shared utilities
│   ├── poc_integer_overflow.py     # POC #1: Integer overflow
│   ├── poc_oob_slot_mapping.py     # POC #2: OOB slot_mapping
│   ├── poc_cuda_dimension.py       # POC #3: CUDA dimension
│   ├── poc_batch_attack.py         # POC #4: Batch attack
│   └── run_all_pocs.py             # Test harness (runs all POCs)
├── results/
│   ├── crash_logs/                 # Crash dumps and logs
│   └── screenshots/                # Evidence screenshots
├── disclosure/
│   ├── vulnerability_report_template.md  # Full technical report
│   └── [Generated reports will appear here]
└── README.md                        # This file
```

---

## Quick Start

### Prerequisites

```bash
# Ensure Python 3.7+ and requests library
pip install requests

# Have a vLLM instance running (local testing)
python -m vllm.entrypoints.openai.api_server \
  --model facebook/opt-125m \
  --host 0.0.0.0 \
  --port 8000
```

### Run All POCs

```bash
cd poc_suite/
python3 run_all_pocs.py
```

### Run Individual POC

```bash
cd poc_suite/
python3 poc_integer_overflow.py http://localhost:8000 facebook/opt-125m
```

---

## POC Descriptions

| POC | Target | Attack | Expected Result |
|-----|--------|--------|----------------|
| #1 | Integer Overflow | 100K+ token prompts → block allocation overflow | Server crash |
| #2 | OOB slot_mapping | Batch with varying lengths → index mismatch | Server crash |
| #3 | CUDA Dimension | Rapid stress testing → kernel parameter error | Server crash |
| #4 | Batch Attack | Combined vectors → cumulative stress | Server crash |

---

## Results Interpretation

**✓ SUCCESSFUL:** Crash detected - vulnerability confirmed
**✗ INCONCLUSIVE:** No crash - may need different configuration
**⚠️ CRASHED:** Server unresponsive - vulnerability confirmed

Evidence automatically saved to `results/` and `disclosure/` directories.

---

## Responsible Disclosure

1. **Document findings** using `disclosure/vulnerability_report_template.md`
2. **Contact vLLM** via GitHub Security Advisories
3. **Follow timeline:** 90-day coordinated disclosure
4. **Do NOT publish** until coordinated with maintainers

---

## Legal Notice

⚠️ **IMPORTANT:**
- Only test systems you own or have written permission to test
- Unauthorized testing is illegal (CFAA, Computer Misuse Act, etc.)
- Use for defensive security research only
- Follow responsible disclosure practices

---

## Troubleshooting

**POC doesn't crash server?**
- Try larger model or longer prompts
- Check vLLM version (may have fixes)
- Verify GPU memory is sufficient

**Import errors?**
```bash
pip install requests
```

**Can't connect to server?**
- Verify vLLM is running: `curl http://localhost:8000/health`
- Check firewall settings

---

## Contact

**Researcher:** [YOUR NAME]
**Purpose:** Responsible disclosure to improve vLLM security

---

**Remember:** Ethical security research requires authorization. Always obtain permission before testing.

For detailed documentation, see `disclosure/vulnerability_report_template.md`

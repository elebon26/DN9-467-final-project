# Operations Runbook — Live Weather Streaming Pipeline

## Overview
This runbook documents how to monitor, validate, and recover the live weather streaming pipeline built on Google Cloud Platform.

Pipeline:
Public Weather API → Cloud Function → Pub/Sub → Dataflow (streaming) → BigQuery → BQML → Looker Studio

---

## Monitoring

### Dataflow
- Go to **GCP Console → Dataflow → Jobs**
- Verify job status is **Running**
- Check **Job Graph** for stalled or failed transforms
- Monitor worker count and throughput

### Pub/Sub
- Go to **Pub/Sub → Subscriptions**
- Ensure backlog is near zero
- Confirm messages are being acknowledged

### APIs & Usage
- Go to **APIs & Services → Metrics**
- Confirm traffic for:
  - Cloud Pub/Sub API
  - Dataflow API
  - BigQuery API

---

## Failure Recovery

### Dataflow Job Failure
1. Stop the failed job
2. Relaunch using the same streaming template and parameters
3. Confirm records resume flowing into BigQuery

### Cloud Function Failure
1. Check **Cloud Logging**
2. Redeploy function if errors persist
3. Confirm Pub/Sub topic receives new messages

---

## Data Validation

### Freshness Check
- Query BigQuery for latest timestamps:
  - Ensure new rows appear every minute

### Volume Check
- Validate rows per minute are consistent
- Watch for sudden drops or spikes

### Schema Check
- Ensure no unexpected NULLs in critical fields
- Temperature, humidity, pressure should remain numeric

---

## Cost Awareness
- Dataflow is the primary cost driver
- Streaming jobs should be stopped when not required
- Monitor BigQuery streaming insert usage

---

## Ownership
- Pipeline Owners: Max Matteucci, Ethan Lebon, Ian Hedges, Caleb Brunton
- Platform: Google Cloud Platform
- Data Source: Public Weather API (no PII)

---

## Notes
- No secrets stored in code
- All data is public and non-sensitive
- IAM follows least-privilege principles

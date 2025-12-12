# 🚧 GCP Infrastructure Setup (infra/)

## 🔌 Enabled Google Cloud Services
To support our real-time weather streaming pipeline, we enabled the following GCP services:
- ☁️ Cloud Functions (API ingestion)
- 📬 Pub/Sub (event streaming)
- 🔄 Dataflow (stream processing)
- 🧱 BigQuery (analytics storage)
- ⏰ Cloud Scheduler (periodic triggering)

These services are required for ingestion, transport, processing, and storage of live API data.

## 👤 Service Accounts Used
The pipeline relies on Google-managed service accounts:
- Cloud Functions runtime service account
- Default Compute Engine service account for Dataflow workers

No custom service accounts were created.

## 🔐 IAM Roles Granted
The following roles were granted to allow components to interact securely:
- Pub/Sub Publisher (Cloud Function → Pub/Sub)
- Pub/Sub Subscriber (Dataflow ← Pub/Sub)
- Dataflow Worker (run streaming jobs)
- BigQuery Data Editor (write streaming rows)
- BigQuery Job User (execute load jobs)

These permissions ensure least-privilege access while allowing the pipeline to run end-to-end.

## 🧠 Why This Infrastructure Is Needed
- Cloud Functions fetch live weather data from an external API
- Pub/Sub decouples ingestion from processing
- Dataflow continuously transforms and streams data
- BigQuery stores both raw and aggregated results for analysis
- Scheduler automates execution without manual triggers

## ✅ Proof of Infrastructure
- Successful Dataflow streaming job (running)
- Pub/Sub topic and subscription active
- BigQuery tables receiving live data
- Job Graph screenshot included as supporting evidence

This folder documents the required infrastructure configuration and satisfies the infrastructure component of the project.

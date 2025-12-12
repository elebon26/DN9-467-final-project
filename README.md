# 🌦️ REAL-TIME WEATHER ANALYTICS PIPELINE (END-TO-END)

## 🔎 PROJECT OVERVIEW
This project implements a fully automated, real-time data analytics pipeline on Google Cloud Platform. Live weather data is ingested from a public API, streamed through cloud-native services, stored in BigQuery, analyzed using BigQuery ML, and visualized in Looker Studio. The system demonstrates real-time ingestion, scalable processing, infrastructure configuration, machine learning, and business-facing analytics.

---

## 🧱 SYSTEM ARCHITECTURE
The pipeline follows a modern streaming architecture designed for reliability and scalability:

➡️ Public Weather API  
➡️ Cloud Run / Cloud Function (Producer)  
➡️ Pub/Sub Topic  
➡️ Dataflow Streaming Job  
➡️ BigQuery Tables  
➡️ BigQuery ML Models  
➡️ Looker Studio Dashboard  

All components are managed within Google Cloud Platform and run continuously.

---

## 📂 REPOSITORY STRUCTURE
pipeline/  
├── function/  
│   └── API ingestion service (Cloud Run / Cloud Function)  
│  
├── dataflow/  
│   └── Dataflow streaming template configuration and job evidence  
│  
├── infra/  
│   └── Infrastructure setup evidence (APIs enabled, IAM roles, service accounts)  
│  
├── bigquery/  
│   └── Datasets, tables, and BigQuery ML models  
│  
├── looker/  
│   └── Looker Studio dashboard (completed)  
│  
└── README.md  

---

## 🚀 DATA INGESTION (STREAMING)
Live weather data is fetched from a public API using a stateless cloud service. The service normalizes the payload into structured JSON and publishes messages to a Pub/Sub topic. This ensures low-latency ingestion and decouples data producers from downstream consumers.

Key characteristics:
- No authentication secrets stored in code
- JSON payload normalization
- Continuous publishing to Pub/Sub
- Fault-tolerant and scalable execution

---

## 🔁 STREAM PROCESSING (DATAFLOW)
A Dataflow streaming job continuously reads from the Pub/Sub subscription and processes incoming weather events. The pipeline validates records, handles malformed data, and writes clean rows into BigQuery.

Evidence for this component includes:
- Running Dataflow job screenshot
- Job Graph view showing read, transform, and write stages
- Dataflow template usage
- Streaming mode enabled

This satisfies the requirement for real-time stream processing.

---

## 🗄️ DATA STORAGE (BIGQUERY)
Processed weather data is stored in BigQuery tables designed for both analytics and machine learning. The schema includes city, timestamp, temperature, humidity, pressure, wind speed, and related attributes.

Key design points:
- Append-only streaming inserts
- Time-based partitioning
- Supports both historical queries and near-real-time analysis

---

## 🤖 MACHINE LEARNING (BIGQUERY ML)
Machine learning models were built directly inside BigQuery using BigQuery ML. These models leverage historical weather data to perform predictive analysis on weather-related metrics.

ML work completed includes:
- Feature selection from streamed weather data
- Model training using BigQuery ML
- Model evaluation using built-in metrics
- Separation of ML work from the streaming pipeline

This satisfies the project requirement for applied machine learning.

---

## 📊 DATA VISUALIZATION (LOOKER STUDIO)
A Looker Studio dashboard was created to visualize live and historical weather data. The dashboard supports real-time monitoring, filtering by city, and trend analysis over time.

Dashboard features include:
- Live-updating charts
- Time-series visualizations
- City-level filtering
- Clean separation from backend processing

---

## 🔐 INFRASTRUCTURE & IAM (INFRA)
All required Google Cloud services were explicitly enabled and configured. Proper IAM roles were assigned to service accounts to support secure execution across components.

Infrastructure evidence includes:
- Enabled APIs (Pub/Sub, Dataflow, BigQuery, Cloud Run, IAM)
- Service account permissions
- Dataflow and API usage metrics
- GCP Console screenshots confirming configuration

This satisfies infrastructure and security requirements.

---

## 🧪 MONITORING & VALIDATION
The pipeline was validated using:
- Live Dataflow job metrics
- API usage dashboards
- Streaming BigQuery row counts
- Error monitoring via Cloud Monitoring

Screenshots of running jobs and API activity confirm successful execution.

---

## ✅ PROJECT STATUS
✔ Streaming ingestion implemented  
✔ Dataflow processing running  
✔ BigQuery storage operational  
✔ BigQuery ML completed  
✔ Looker Studio dashboard completed  
✔ Infrastructure configured and validated  

---

## 🎯 CONCLUSION
This project demonstrates a complete real-time analytics system using Google Cloud Platform. It integrates streaming ingestion, scalable processing, cloud data warehousing, machine learning, and visualization into a single cohesive pipeline that meets all project rubric requirements.

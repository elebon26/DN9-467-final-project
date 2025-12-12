⚙️⚙️⚙️  STREAMING WEATHER PIPELINE  ⚙️⚙️⚙️
========================================

PURPOSE
-------
This pipeline ingests live weather data from a public API and streams it into BigQuery in near real time for analytics and dashboards.


PIPELINE STRUCTURE
------------------

📁 pipeline/


🌐 FUNCTION  (DATA INGESTION LAYER)
----------------------------------
- Cloud Function (2nd gen)
- Calls the Open-Meteo public API 🌍
- Normalizes API responses into JSON
- Publishes messages to Pub/Sub 📬
- Files included:
  • main.py  → API call + message publishing
  • requirements.txt  → Python dependencies


🚀 DATAFLOW  (STREAMING PROCESSING LAYER)
----------------------------------------
- Google-managed Dataflow streaming template
- Subscribes to Pub/Sub topic
- Continuously writes records into BigQuery
- Uses template parameters only
- No custom Apache Beam code required


🛠️ INFRA  (PROJECT SETUP & SECURITY)
------------------------------------
- Enables required GCP APIs
- Configures service accounts
- Assigns IAM roles for:
  • Cloud Functions
  • Pub/Sub
  • Dataflow
  • BigQuery
- Stores gcloud setup commands


DATA FLOW
---------
Open-Meteo API 🌍
→ Cloud Function ☁️
→ Pub/Sub 📬
→ Dataflow (Streaming) 🔄
→ BigQuery (live_weather table) 📊


FINAL RESULT
------------
✅ Fully serverless
✅ Near real-time ingestion
✅ Automatically updating BigQuery table
✅ Ready for Looker dashboards and analysis

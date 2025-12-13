

# **Final Project Contribution — Ian Hedges**

## **Live API Streaming Support (Open‑Meteo + Cloud Run)**  
I helped troubleshoot and refine the Cloud Run service that pulls live weather data from the Open‑Meteo API. Most of my work here involved fixing small issues, checking logs, making sure the service actually deployed correctly, and verifying that data was showing up in BigQuery the way we expected. I didn’t build the whole pipeline myself, but I supported the setup and made sure the streaming piece stayed stable while we tested.

---

## **Troubleshooting & Debugging**  
A lot of my contribution came from helping diagnose problems across the pipeline. This included things like:

- figuring out why certain API responses weren’t being parsed correctly  
- checking schema mismatches in BigQuery  
- confirming that hourly timestamps and deltas were being calculated correctly  
- helping test the pipeline end‑to‑end whenever something broke  

Basically, I helped keep things running smoothly while the main components were being built.

---

## **Data Preparation & Presentation Slides**  
I worked on the **data preparation** section of our presentation. I helped explain:

- how the Open‑Meteo data flows into Cloud Run  
- how it ends up in BigQuery  
- how we turned raw data into hourly averages and deltas  

I also helped clean up the slides so they were easier to follow and matched what we actually built.

---

## **Cloud Resource Setup (BigQuery + GCP)**  
I assisted with setting up and organizing our BigQuery tables, especially the `live_weather_with_delta` table. I helped with:

- creating datasets  
- checking schemas  
- making sure everyone had the right IAM permissions  
- connecting the tables to Looker Studio  

Nothing too fancy, but important for making sure the team could access everything.

---

## **General Project Support**  
Throughout the project, I helped document what we were doing, double‑check our logic, and make sure our data transformations made sense. I wasn’t leading any major component, but I contributed across multiple areas to keep things consistent and working.



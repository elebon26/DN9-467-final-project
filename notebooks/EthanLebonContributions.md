# Final Project Contribution — Ethan Lebon

## Streaming Insight Development & Feature Engineering
I developed the project’s primary analytical insight by engineering the **Temperature Volatility Index (TVI)** using the standard deviation of hourly temperature deltas from our streaming data. This metric highlighted short-term instability across cities—something not visible from raw temperature readings alone. I validated TVI through BigQuery queries and Python exploration, confirming it reflected real hourly variability rather than noise. This insight became a core component of our dashboard and final narrative.

## BigQuery Analysis & Troubleshooting
I contributed extensively to querying and validating both the batch and streaming datasets in BigQuery. This included extracting the hourly streaming features (`ts_hour`, `temp_hour_avg`, `temp_delta_1h`), verifying schema correctness, and assisting with debugging issues such as table naming mismatches, missing fields, and timestamp conversions. I ensured our derived features aligned with the transformations occurring in the Dataflow pipeline and supported the modeling and dashboard layers.

## Looker Studio Dashboard Enhancements
I expanded the team dashboard by adding three new visual components centered on the TVI metric:
- A **TVI scorecard** summarizing the average volatility over the last 12 hours  
- A **city-ranked bar chart** comparing volatility levels  
- A **scatterplot** relating TVI to hourly average temperature  

I also assisted with layout organization, color theming, and ensuring the visuals matched BigQuery outputs. These additions increased chart diversity and strengthened the dashboard’s analytical depth.

## Pipeline Testing & Verification
I helped test the real-time pipeline by triggering Cloud Function runs, monitoring Pub/Sub message ingestion, and reviewing Dataflow’s execution graph to confirm successful and failed record handling. I checked that the streaming tables were updating correctly and that derived fields such as `temp_delta_1h` were being computed consistently. This ensured the reliability of the data powering our modeling and dashboard.

## Presentation Support
I contributed to preparing the final project slide deck by helping structure the data preparation, streaming pipeline, and insight sections. I refined the messaging around TVI and created visuals that translated well into the final recorded presentation.

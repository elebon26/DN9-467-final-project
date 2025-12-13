# Final Project Contribution — Max Matteucci

## End-to-End Data Pipeline (GCP)
I set up the complete cloud pipeline for this project. This included configuring **Pub/Sub** for message ingestion, deploying a **Cloud Run** service to fetch live weather data from an external API, and streaming that data through **Dataflow** into **BigQuery**. The pipeline supports continuous, near real-time ingestion with schema validation and error handling.  I then pasted the proof of these into the pipeline and docs section.  I also managed the acccess of the other users through the IAM & Admin section.

## Batch Historical Data Integration
In addition to streaming data, I integrated **historical weather data from Kaggle** into BigQuery. This batch dataset was used to provide historical context, support modeling, and enable longer-term analytics alongside the live streaming data.  I did this all throught GCP with no Colab required.  Specifically, I batch uploaded all the CSV's from the dataset onto GCP, and integrated it using a batch load job.  Furthermore, I combined these CSV's into one long-form table, as it matched closer to the structure of our streaming data, and thus was far more suitable for machine learning.

## Machine Learning Pipeline
I trained a machine learning model using BigQuery ML with a linear regression approach to forecast next-hour temperature (temp_plus_1h). The model used real-time weather signals along with temporal features including hour of day, day of week, and month. I evaluated the model using ML.EVALUATE, achieving a mean absolute error under 1°C and an R² of approximately 0.98, demonstrating strong short-horizon predictive accuracy.

To ensure transparency and interpretability, I applied ML.EXPLAIN_PREDICT on live streaming data to understand feature-level contributions for each prediction. I wrote both the predictions and their explanatory attributions back to BigQuery and integrated them into Looker Studio, where they were used to contextualize real-time temperature trends and volatility across cities.

## Looker Studio Dashboard
I began the **Looker Studio dashboard**, and added the following charts:
- The live weather **table** showing current conditions by city
- The **time-series chart** displaying temperature trends over time  
These visuals are connected directly to the BigQuery tables produced by the pipeline and update automatically as new data arrives.

## GitHub Pipeline & Documentation
I created and maintained the **pipeline and documentation sections** of the GitHub repository. This includes explaining the pipeline architecture, data flow, infrastructure setup, and operational details so the project is reproducible and easy to evaluate.

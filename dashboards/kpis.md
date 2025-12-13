# 📊 Dashboard KPIs – Live Weather Analytics

🔗 **Live Looker Studio Dashboard**  
https://lookerstudio.google.com/reporting/7583f6ff-725b-4507-b47e-4dd24c4c485d

---

## 🌦 Overview

This dashboard visualizes **near–real-time weather data for major U.S. cities**, streamed continuously through our GCP pipeline (Pub/Sub → Dataflow → BigQuery → Looker Studio).

The dashboard focuses on **temperature behavior, volatility, and short-term trends**, enabling quick comparison across cities and over time.

⚠️ *Note:* Occasional `null` readings may appear due to upstream weather API or station availability. These self-resolve as new data arrives.

---

## 📋 Live Weather Table

**Purpose:**  
Provides the most recent weather snapshot per city.

**Fields Displayed:**
- City
- Timestamp (UTC-adjusted)
- Temperature (°C)
- Pressure (hPa)
- Humidity (%)
- Wind Speed (m/s)

**Usage:**  
Used as a real-time operational view to verify ingestion health and data freshness.

---

## 🌡 Real-Time Temperature (Time Series)

**Metric:** Temperature (°C)  
**Granularity:** Minute-level streaming data

**Purpose:**  
Shows short-term temperature movement for selected cities, validating:
- Streaming continuity
- Temporal trends
- Sudden anomalies or drops

---

## ⏱ Hourly Temperature Change

**Metric:** Hour-over-hour temperature delta  
**Calculation:**  
Current hour average temperature minus previous hour average temperature

**Purpose:**  
Captures **short-term temperature volatility**, highlighting:
- Rapid environmental changes
- Weather instability by city

---

## 📈 Temperature Volatility Index (TVI)

### 🔹 Average TVI Over Last 12 Hours (Scorecard)

**Definition:**  
TVI represents the **average absolute hourly temperature change** over the past 12 hours.

**Interpretation:**
- Higher TVI = more volatile temperature behavior
- Lower TVI = stable temperature conditions

This scorecard shows the **global average TVI across all cities**.

---

### 🔹 Average TVI Over Last 12 Hours by City (Bar Chart)

**Purpose:**  
Ranks cities by temperature volatility.

**Use Case:**  
Identifies which cities experienced the most temperature fluctuation in the last 12 hours.

---

## 🔬 Temperature Volatility vs. Hourly Average Temperature

**Chart Type:** Scatter plot

**Axes:**
- X-axis: Average hourly temperature
- Y-axis: Average TVI (last 12 hours)

**Purpose:**  
Explores the relationship between:
- Absolute temperature level
- Short-term volatility

This helps distinguish:
- Hot but stable cities
- Cooler yet highly volatile cities

---

## 🧭 Dashboard Controls

- **City Filter:** Allows interactive city selection
- **Auto-refresh:** Reflects live streaming updates
- **Time Window:** Rolling 12-hour analytics for volatility metrics

---

## ✅ What This Dashboard Demonstrates

- Successful real-time ingestion via Pub/Sub and Dataflow
- Reliable streaming writes into BigQuery
- Aggregations and analytics performed in BigQuery
- Production-ready visualization layer in Looker Studio

This dashboard serves as the **final analytics and presentation layer** of our end-to-end GCP weather pipeline.

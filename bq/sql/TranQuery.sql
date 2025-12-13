CREATE OR REPLACE TABLE `finalprojectfor467.weather_proj.temp_training` AS
WITH lagged AS (
  SELECT
    ts,
    city,
    temperature,
    humidity,
    pressure,
    wind_speed,
    wind_direction,
    EXTRACT(HOUR      FROM ts) AS hour_of_day,
    EXTRACT(DAYOFWEEK FROM ts) AS day_of_week,
    EXTRACT(MONTH     FROM ts) AS month,
    LEAD(temperature, 1) OVER (
      PARTITION BY city
      ORDER BY ts
    ) AS temp_plus_1h
  FROM `finalprojectfor467.weather_proj.historical_weather`
)
SELECT *
FROM lagged
WHERE temp_plus_1h IS NOT NULL;

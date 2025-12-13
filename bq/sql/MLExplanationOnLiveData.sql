SELECT *
FROM ML.EXPLAIN_PREDICT(
  MODEL `finalprojectfor467.weather_proj.temp_forecast_model`,
  (
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
      EXTRACT(MONTH     FROM ts) AS month
    FROM `finalprojectfor467.weather_proj.live_weather`
    WHERE city = 'Seattle'
    ORDER BY ts DESC
    LIMIT 1
  )
);

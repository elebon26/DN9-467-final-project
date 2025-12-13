CREATE OR REPLACE VIEW weather_proj.live_weather_filled AS
SELECT
  city,
  ts,
  LAST_VALUE(temperature IGNORE NULLS)
    OVER (
      PARTITION BY city
      ORDER BY ts
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS temperature,
  pressure,
  humidity,
  wind_speed
FROM weather_proj.live_weather;

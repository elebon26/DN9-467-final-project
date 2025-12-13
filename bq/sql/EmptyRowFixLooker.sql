CREATE OR REPLACE VIEW `finalprojectfor467.weather_proj.latest_weather_filled` AS
SELECT
  city,
  ts,

  LAST_VALUE(temperature IGNORE NULLS) OVER w AS temperature,
  LAST_VALUE(humidity IGNORE NULLS)    OVER w AS humidity,
  LAST_VALUE(pressure IGNORE NULLS)    OVER w AS pressure,
  LAST_VALUE(wind_speed IGNORE NULLS)  OVER w AS wind_speed,
  LAST_VALUE(wind_direction IGNORE NULLS) OVER w AS wind_direction

FROM `finalprojectfor467.weather_proj.live_weather`

WINDOW w AS (
  PARTITION BY city
  ORDER BY ts
  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
);

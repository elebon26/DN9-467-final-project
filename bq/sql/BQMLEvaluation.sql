SELECT *
FROM ML.EVALUATE(
  MODEL `finalprojectfor467.weather_proj.temp_forecast_model`,
  (
    SELECT
      city,
      temperature,
      humidity,
      pressure,
      wind_speed,
      wind_direction,
      hour_of_day,
      day_of_week,
      month,
      temp_plus_1h
    FROM `finalprojectfor467.weather_proj.temp_training`
  )
);

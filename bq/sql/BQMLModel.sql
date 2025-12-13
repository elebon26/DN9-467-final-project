CREATE OR REPLACE MODEL `finalprojectfor467.weather_proj.temp_forecast_model`
OPTIONS(
  model_type = 'linear_reg',
  input_label_cols = ['temp_plus_1h']
) AS
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
FROM `finalprojectfor467.weather_proj.temp_training`;

CREATE OR REPLACE VIEW `finalprojectfor467.weather_proj.latest_weather` AS
SELECT *
FROM `finalprojectfor467.weather_proj.live_weather`
QUALIFY ts = MAX(ts) OVER (PARTITION BY city);

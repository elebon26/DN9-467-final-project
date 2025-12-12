import functions_framework
import requests
import json
from google.cloud import pubsub_v1
import datetime

# Pub/Sub topic to publish into
PROJECT_ID = "finalprojectfor467"
TOPIC_ID = "weather-stream"

publisher = pubsub_v1.PublisherClient()
topic_path = publisher.topic_path(PROJECT_ID, TOPIC_ID)

CITIES = {
    "Seattle": (47.6062, -122.3321),
    "Portland": (45.5152, -122.6784),
    "San Francisco": (37.7749, -122.4194),
    "Los Angeles": (34.0522, -118.2437),
    "San Diego": (32.7157, -117.1611),
    "Las Vegas": (36.1699, -115.1398),
    "Phoenix": (33.4484, -112.0740),
    "Denver": (39.7392, -104.9903),
    "Albuquerque": (35.0844, -106.6504),
    "Vancouver": (49.2827, -123.1207)
}

@functions_framework.http
def main(request):
    for city, (lat, lon) in CITIES.items():
        url = (
            "https://api.open-meteo.com/v1/forecast?"
            f"latitude={lat}&longitude={lon}"
            "&current=temperature_2m,relative_humidity_2m,"
            "pressure_msl,wind_speed_10m,wind_direction_10m,weather_code"
        )
        r = requests.get(url)
        data = r.json()

        current = data.get("current", {})
        payload = {
            "ts": datetime.datetime.utcnow().isoformat(),
            "city": city,
            "temperature": current.get("temperature_2m"),
            "humidity": current.get("relative_humidity_2m"),
            "pressure": current.get("pressure_msl"),
            "wind_speed": current.get("wind_speed_10m"),
            "wind_direction": current.get("wind_direction_10m"),
            "weather_description": str(current.get("weather_code"))
        }

        publisher.publish(topic_path, json.dumps(payload).encode("utf-8"))

    return ("OK", 200)

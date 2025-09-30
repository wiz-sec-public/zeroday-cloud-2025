from flask import Flask
from prometheus_flask_exporter import PrometheusMetrics

# Create a Flask application instance
app = Flask(__name__)

# Apply the Prometheus metrics exporter to the Flask app.
# This will automatically create a /metrics endpoint.
metrics = PrometheusMetrics(app)

@app.route('/')
def hello():
    """A simple route that returns a welcome message."""
    return "Hello from your Python HTTP Server!"

if __name__ == '__main__':
    # Run the app on all available network interfaces, on port 5000
    app.run(host='0.0.0.0', port=5000)

FROM python:3.12-slim-bookworm
RUN apt-get update && apt-get install -y --no-install-recommends openjdk-17-jre-headless unzip \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir pyspark==4.0.2
COPY . .
RUN unzip -q models/models.zip -d /tmp/m && mv /tmp/m/models/best_sentiment_model models/ && rm -rf /tmp/m
ENTRYPOINT ["python", "src/predict.py"]

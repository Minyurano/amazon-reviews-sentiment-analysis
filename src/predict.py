"""Prédiction du sentiment d'avis clients avec le modèle Spark sauvegardé.

Utilisation :
    python src/predict.py "This product is excellent!" "Terrible quality."

Décompresser d'abord models/models.zip -> models/best_sentiment_model
"""
import sys
from pathlib import Path

from pyspark.ml import PipelineModel
from pyspark.sql import SparkSession

MODEL_DIR = Path(__file__).resolve().parent.parent / "models" / "best_sentiment_model"
LABELS = {0.0: "Négatif", 1.0: "Neutre", 2.0: "Positif"}


def main(textes):
    if not MODEL_DIR.exists():
        sys.exit(f"Modèle introuvable : {MODEL_DIR}\nDécompressez d'abord models/models.zip dans models/.")
    spark = SparkSession.builder.appName("AmazonSentiment-Predict").getOrCreate()
    spark.sparkContext.setLogLevel("ERROR")
    model = PipelineModel.load(str(MODEL_DIR))
    avis = spark.createDataFrame([(t,) for t in textes], ["Text"])
    for row in model.transform(avis).select("Text", "prediction").collect():
        print(f"[{LABELS.get(row.prediction, row.prediction)}] {row.Text}")
    spark.stop()


if __name__ == "__main__":
    main(sys.argv[1:] or [
        "This product is excellent, I love it!",
        "Terrible quality, it broke after two days.",
        "It is okay, nothing special.",
    ])

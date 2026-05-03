
# Analyse des avis des clients Amazon en temps reel

## Mini Projet Big Data - IASD 2025-2026

### Description
Ce projet realise une analyse de sentiment en temps reel sur les avis des produits Amazon.

### Performances du modele
- **Modele** : Logistic Regression
- **Accuracy** : 85.07%
- **F1-Score** : 82.89%

### Resultats par classe

| Sentiment | Precision | Nombre d'avis |
|-----------|-----------|----------------|
| Positif | 96.9% | 43,997 |
| Negatif | 58.3% | 8,356 |
| Neutre | 15.9% | 4,277 |

### Flux Kafka (Online)
- **Precision sur 30 messages** : 93.3% (28/30 corrects)
- **Temps moyen par prediction** : ~500ms

### Structure du projet
- notebook.ipynb (Notebook principal)
- models/ (Modele sauvegarde)
- product_scoring.png (Scoring des produits)
- predictions_by_date.png (Evolution temporelle)
- confusion_matrix.png (Matrice de confusion)
- top_products.png (Top 15 produits)
- kafka_stream_results.csv (Resultats du flux)

### Technologies utilisees
- Python 3.12
- Apache Spark 4.0.2
- PySpark MLlib
- Scikit-learn
- Matplotlib / Seaborn

### Auteur
**minyurano** - Master IASD

### Date
03/05/2026
#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
[ -d models/best_sentiment_model ] || python -c "import zipfile; zipfile.ZipFile('models/models.zip').extractall('.')"
python src/predict.py "$@"

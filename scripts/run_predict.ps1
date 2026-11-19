Set-Location (Join-Path $PSScriptRoot "..")
if (-not (Test-Path "models\best_sentiment_model")) {
    python -c "import zipfile; zipfile.ZipFile('models/models.zip').extractall('.')"
}
python src\predict.py @args

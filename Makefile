.PHONY: install model predict docker-build docker-run up down

install:
pip install -r requirements.txt

model:
python -c "import zipfile; zipfile.ZipFile('models/models.zip').extractall('.')"

predict: model
python src/predict.py

docker-build:
docker build -t amazon-sentiment .

docker-run:
docker run --rm amazon-sentiment "Great product, I love it!"

up:
docker compose up --build

down:
docker compose down

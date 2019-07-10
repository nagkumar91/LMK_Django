#!/usr/bin/env bash
virtualenv .env -p python3
source ./.env/bin/activate
cd lmk
python manage.py collectstatic --no-input
gsutil rsync -r static/ gs://lmk-static/static
pip install -r requirements.txt
docker build -t gcr.io/letmeknow-243504/lmk .
docker push gcr.io/letmeknow-243504/lmk
kubectl apply -f lmk.yaml

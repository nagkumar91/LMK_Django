#!/usr/bin/env bash
. venv/bin/activate
cd lmk
python manage.py collectstatic --no-input
gsutil rsync -rm static/ gs://lmk-static/static
docker build -t gcr.io/letmeknow-243504/lmk .
docker push gcr.io/letmeknow-243504/lmk
kubectl apply -f lmk.yaml

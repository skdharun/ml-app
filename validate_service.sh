#!/bin/bash
set -e

echo "Validating Student Result Predictor..."

for i in $(seq 1 20); do
    if curl --fail --silent http://127.0.0.1/ \
        | grep -q "Student Result Predictor"; then
        echo "Application is running successfully!"
        exit 0
    fi

    echo "Waiting for application... attempt $i/20"
    sleep 3
done

echo "Application validation failed!"
docker logs student-app || true
exit 1

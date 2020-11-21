#!/usr/bin/env bash
set -euo pipefail

image="iandavis/minecraft-forge:1.12.2"
docker build -t $image .
docker push $image

# test via docker run -p 25565:25565 iandavis/minecraft-forge:1.12.2

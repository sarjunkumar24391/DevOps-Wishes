#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

set -x
docker build -f Dockerfile.build -t sarjunkumar24391/devops-wishes:build .
docker run sarjunkumar24391/devops-wishes:build cat Test > Test
chmod +x Test

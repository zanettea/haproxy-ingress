#!/bin/sh

GIT_COMMIT=git-$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
GIT_REPO=$(git config --get remote.origin.url 2>/dev/null || echo "unknown")

docker build \
  --build-arg GIT_COMMIT="$GIT_COMMIT" \
  --build-arg GIT_REPO="$GIT_REPO" \
  -f builder/Dockerfile -t eu.gcr.io/corvina-exorint/haproxy-ingress-controller:v1 .


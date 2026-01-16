#!/bin/bash
docker stop app || true
docker rm app || true
docker run -d --name app -p 80:80 $1

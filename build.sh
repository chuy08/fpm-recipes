#!/usr/bin/env bash

export APPLICATION_NAME=fpm-cookery
export REPO=chuy08

# Linux commands
export BUILD_TIME=$(date +"%Y-%m-%d_%T")
export BUILD_VERSION=0.0.1

echo "Application Name: $APPLICATION_NAME"
echo "Build Version: $BUILD_VERSION"

docker build -t $REPO/$APPLICATION_NAME .
#docker tag $REPO/$APPLICATION_NAME $REPO/$APPLICATION_NAME:$BUILD_VERSION
#docker image push $REPO/$APPLICATION_NAME:$BUILD_VERSION


#!/bin/bash


IMAGE="myjava-app"

echo "***** Logging into Docker-Hub *****"

docker login -u shambho3003 -p $PASS

echo "***** Tagging Image for Versoning *****"

docker tag $IMAGE:$BUILD_TAG shambho3003/$IMAGE:$BUILD_TAG

echo "***** Pushing Image to Docker-Hub *****"

docker push shambho3003/$IMAGE:$BUILD_TAG

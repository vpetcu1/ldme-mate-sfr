#!/bin/bash
IMAGE_NAME="vpetcu1/ldme-mate-"
source ./.env
if [ -z "${TAG}" ] || [ -z "${PROJECT}" ]; then
    echo "No TAG or PROJECT specified"
    exit 1
fi
echo ${IMAGE_NAME}${PROJECT}:${TAG}
sudo docker build -t ${IMAGE_NAME}${PROJECT}:${TAG} --build-arg PROJECT=${PROJECT} .
#sudo docker build --no-cache -t ${IMAGE_NAME}${PROJECT}:${TAG} --build-arg PROJECT=${PROJECT} .
sudo docker login
sudo docker push ${IMAGE_NAME}${PROJECT}:${TAG}

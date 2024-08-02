#!/bin/bash

# Load environment variables from the .env file
if [ -f .env ]; then
  export $(cat .env | xargs)
else
  echo ".env file not found"
  exit 1
fi

build_image() {
    echo "Building Docker image..."
    docker build --platform linux/amd64 -t ${IMAGE_NAME} .
}

push_image() {
    echo "Logging into Docker..."
    docker login

    echo "Tagging Docker image..."
    docker tag ${IMAGE_NAME} ${DOCKER_REPO}/${IMAGE_NAME}:${TAG}

    echo "Pushing Docker image to repository..."
    docker push ${DOCKER_REPO}/${IMAGE_NAME}:${TAG}
}

build_image() {
    echo "Building Docker image..."
    docker build --platform linux/amd64 -t ${IMAGE_NAME} .
}

push_image() {
    echo "Logging into Docker..."
    docker login

    echo "Tagging Docker image..."
    docker tag ${IMAGE_NAME} ${DOCKER_REPO}/${IMAGE_NAME}:${TAG}

    echo "Pushing Docker image to repository..."
    docker push ${DOCKER_REPO}/${IMAGE_NAME}:${TAG}
}

deploy_on_aws() {
    echo "Connecting to AWS server..."
    ssh -i ${SSH_KEY_PATH} ${SSH_USER}@${AWS_IP} <<EOF
        echo "Stopping current Docker container..."
        docker stop ${IMAGE_NAME} || true

        echo "Removing current Docker container..."
        docker rm ${IMAGE_NAME} || true

        echo "Pulling latest Docker image..."
        docker pull ${DOCKER_REPO}/${IMAGE_NAME}:${TAG}

        echo "Running new Docker container..."
        docker run -d -p ${HOST_PORT}:${CONTAINER_PORT} --name ${IMAGE_NAME} ${DOCKER_REPO}/${IMAGE_NAME}:${TAG}
EOF
}

# Execute the functions
build_image
push_image
deploy_on_aws

echo "Deployment complete."
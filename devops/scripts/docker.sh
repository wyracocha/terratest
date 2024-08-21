#!/bin/bash

script_get_version () {
    export TAG=$(cat CHANGELOG.md | grep "##" | head -1 | cut -d " " -f2)
}

script_docker_login () {
    echo $DOCKER_PAT | docker login -u $DOCKER_USER --password-stdin
}

script_docker_build () {
    script_get_version
    docker build -t $DOCKERHUB_REPO_OWNER/$REPO_NAME:latest .
    docker build -t $DOCKERHUB_REPO_OWNER/$REPO_NAME:$TAG .
}

script_docker_push () {
    script_docker_login
    docker push -a $DOCKERHUB_REPO_OWNER/$REPO_NAME
}
"$@"

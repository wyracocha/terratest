#!/bin/bash

script_get_version () {
    export TAG=$(cat CHANGELOG.md | grep "##" | head -1 | cut -d " " -f2)
}

script_docker_login () {
    echo $DOCKER_PAT | docker login $DOCKER_HOST -u $DOCKER_USER --password-stdin
}

script_docker_build () {
    script_get_version
    docker build -t $DOCKER_HOST/$DOCKER_USER:$TAG
    docker build -t $DOCKER_HOST/$DOCKER_USER:latest
}

script_docker_push () {
    docker push -a $DOCKER_HOST/$DOCKER_USER
}
"$@"
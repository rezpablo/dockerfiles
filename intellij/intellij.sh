#!/bin/bash

docker run -ti --rm \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v $PROJECT_HOME/:/project \
           -p 3000:3000 \
           -p 8080:8080 \
           --name intellij \
           rezpablo/intellij

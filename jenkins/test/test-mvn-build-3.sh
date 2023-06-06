#!/bin/bash

echo "*******************************"
echo "****** Testing Our Build ******"
echo "*******************************"
WORKSPACE=/home/jenkins/jenkins-data/jenkins_home/workspace/pipeline-docker-maven

docker run --rm -v $WORKSPACE/java-app/:/app -v /root/.m2:/root/.m2/ -w /app maven "$@"

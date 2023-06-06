#!/bin/bash

#Copy the .jar file from your project's location to target directory
cp java-app/target/*.jar jenkins/build/app.jar

#Building Docker image which is having Jar file in it.

 docker-compose build --no-cache

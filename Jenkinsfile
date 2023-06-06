pipeline {
    agent any
	environment{
	PASS= credentials('Docker-Hub-Registry-Password')
	}
    stages {
        stage('Build') {
            steps {
                // Perform the build step
                // You can use any build tool or script here
                sh './jenkins/build/build-jarfile-1.sh mvn package'
                // Build a Docker image containing your application (jar file)
                sh './jenkins/build/builddkr-img2.sh'
            }
		 post {
	       success {
            archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
           // junit 'build/reports/**/*.xml'
        }
    }

        }

        stage('Test') {
            steps {
                // Run tests for your application
                // You can use any testing framework or script here
                sh './jenkins/test/test-mvn-build3.sh mvn test'
                // Push your Docker image to Docker Hub
                sh './jenkins/test/push-dkr-img-hub-4.sh'
            }
		 post {
               success {
                        junit 'java-app/target/surefire-reports/*.xml'
                       }   

        }
	}

        stage('Push') {
            steps {
                // Push your Docker image to Docker Hub
                sh './jenkins/test/push-dkr-img-hub-4.sh'
            }
        }

        stage('Deploy') {
            steps {
                // Perform deployment steps
                // This can include pushing artifacts, deploying to servers, etc.
                sh './jenkins/deployfile/deploy-env-vars-5.sh'
            }
        }
	}
   }



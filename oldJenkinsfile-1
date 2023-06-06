pipeline {
    agent any

        stage('Build') {
            steps {
                // Perform the build step
                // You can use any build tool or script here
                sh '''
			./jenkins/build/ build-jarfile.sh mvn package
		// Build an docker image which contains your application i.e. your jar file
			./jenkins/build/ builddkr-img2.sh
		   '''
            }
        }

        stage('Test') {
            steps {
                // Run tests for your application
                // You can use any testing framework or script here
                sh '''
			./jenkns/test/test-mvn-build3.sh mvn test
		// Push Your Docker Image to Docker-Hub
			./jenkins/test/push-dkr-img-hub-4.sh
	
		'''
            }
        }
	
	stage('Push') {
            steps {
                // Push your Docker Image to Docker-Hub Account
                // You can use any testing framework or script here
                sh '''
                         // Push Your Docker Image to Docker-Hub
                        ./jenkins/test/push-dkr-img-hub-4.sh

                '''
            }
        }


        stage('Deploy') {
            steps {
                // Perform deployment steps
                // This can include pushing artifacts, deploying to servers, etc.
                sh '''
			./jenkins/deployfile/deploy-env-vars-5.sh
		''' 
            }
        }

	}
}


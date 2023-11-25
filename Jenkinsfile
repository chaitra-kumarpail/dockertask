pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-cred')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t amazon/dockertask:latest -f Dockerfile .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker tag amazon/dockertask:latest chaitrasp/dockertask:latest'
				sh 'docker push chaitrasp/dockertask:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}

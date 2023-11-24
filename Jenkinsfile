pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-cred')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/chaitra-kumarpail/dockertask.git'
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t amazon/dockertask:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push chaitrasp/dockertest:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
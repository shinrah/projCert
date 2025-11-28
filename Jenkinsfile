pipeline {
    agent any
    
    environment {
        IMAGE_NAME = "projcert-app"
    }

    stages {
        stage('Clone Code') {
            steps {
                git url: 'https://github.com/shinrah/projCert', branch: 'master'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Test') {
            steps {
                echo "Docker build successful!"
            }
        }
    }
}

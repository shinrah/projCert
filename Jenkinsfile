pipeline {
    agent any
    
    environment {
        IMAGE_NAME = "projcert-app"
        DOCKER_HUB_USER = "shinrahmonu"
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
                    docker.build("${DOCKER_HUB_USER}/${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
                        docker.image("${DOCKER_HUB_USER}/${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }

        stage('Test') {
            steps {
                echo "Docker image pushed to Docker Hub successfully!"
            }
        }

        stage('Deploy to Test Server') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'test-server-key', keyFileVariable: 'SSH_KEY')]) {
                    sh 'ansible-playbook deploy-test.yml -i hosts --private-key=$SSH_KEY'
                }
            }
        }

        stage('Deploy to Prod Server') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'test-server-key', keyFileVariable: 'SSH_KEY')]) {
                    sh 'ansible-playbook deploy-prod.yml -i hosts --private-key=$SSH_KEY'
                }
            }
        }
    }
}

pipeline {
    agent { label 'test' }

    environment {
        IMAGE_NAME = "php-webapp"
    }

    stages {

        stage('Clone Repo') {
            steps {
                git branch: 'master', url: 'https://github.com/shinrah/projCert.git'
                echo 'Repository cloned successfully'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t myphpapp:latest .
                '''
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh '''
                    echo "$PASS" | docker login -u "$USER" --password-stdin
                    docker tag myphpapp:latest $USER/${IMAGE_NAME}:latest
                    docker push $USER/${IMAGE_NAME}:latest
                    docker logout
                    '''
                }
            }
        }

        stage('Security Scan Image') {
            steps {
                sh '''
                trivy image --exit-code 1 --severity CRITICAL,HIGH $USER/${IMAGE_NAME}:latest
                '''
            }
        }

        stage('Deploy Docker Container') {
            steps {
                sh '''
                docker stop myphpapp || true
                docker rm myphpapp || true
                docker run -d -p 8080:80 --name myphpapp $USER/${IMAGE_NAME}:latest
                '''
            }
        }
    }

    post {
        failure {
            echo "Build Failed — Cleaning up container"
            sh 'docker rm -f myphpapp || true'
        }
    }
}

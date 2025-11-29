pipeline {
    agent { label 'test' }

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

        stage('Deploy Docker Container') {
            steps {
                sh '''
                docker stop myphpapp || true
                docker rm myphpapp || true
                docker run -d -p 8080:80 --name myphpapp myphpapp:latest
                '''
            }
        }
    }

    post {
        failure {
            sh 'docker rm -f myphpapp || true'
        }
    }
}

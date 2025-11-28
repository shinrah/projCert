pipeline {
    agent any

    stages {
        stage('Clone Code') {
            steps {
                git url: 'https://github.com/shinrah/projCert', branch: 'master'
            }
        }
        stage('Test') {
            steps {
                echo "Jenkins connected successfully!"
            }
        }
    }
}

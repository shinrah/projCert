pipeline {
    agent any

    stages {
        stage('clonegit') {
            steps {
                git branch: 'master', url: 'https://github.com/shinrah/projCert.git'
                echo 'Repository clone sucessfully'
            }
        }
    }
}

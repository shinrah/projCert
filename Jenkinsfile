pipeline {
    agent any

    stages{
        stage('clone the repo')
        steps{
            git (branch: 'master', url: 'https://github.com/shinrah/projCert.git')
            echo 'repostory sucessfully clone'
        }
    }
}

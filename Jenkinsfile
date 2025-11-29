pipeline {
    agent any

    stages{
        stage("clean up workspace") {
            steps{
                cleanWs()
            }
        }
        stage{
            steps{
                git: url 'https://github.com/shinrah/projCert.git', branch: 'master'
            }
        }
    }
}

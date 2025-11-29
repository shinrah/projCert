pipeline {
    agent any
    stages{
        stage("clean up workspace"){
            steps{
                cleanWs()
            }
        }

        stages{
            stage("clone git repository"){
                steps{
                    git url 'https://github.com/shinrah/projCert.git', branch: 'master'
                }
            }
        }
    }
}

pipeline{
    agent any
    stages{
        stage("test"){
            steps{
                script{
                    echo 'test application'
                }
            }
        }
        stage("build"){
            steps{
                script{
                    dockerImage = docker.build("ghcr.io/saifeddiner/presta_project:${env.BUILD_NUMBER}")
                    docker.withRegistry( '', "secret_github" ) {
                        dockerImage.push()
                     }
                }
            }
        }
        stage("deployment"){
            steps{
                script{
                    echo 'deploy application'
                }
            }
        }
    }
}
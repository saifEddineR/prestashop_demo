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
                    dockerImage = docker.build("ghcr.io/saifeddiner/presta_project")
                    docker.withRegistry( '', "docker_github" ) {
                        dockerImage.push("$BUILD_NUMBER")
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
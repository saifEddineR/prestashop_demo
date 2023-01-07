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
                    dockerImage = docker.build("saifeddiner/presta_project")
                    docker.withRegistry( 'ghcr.io', "docker_github" ) {
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
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
                    docker.withRegistry( '', "docker_github" ) {
                        dockerImage.push("v1.0")
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
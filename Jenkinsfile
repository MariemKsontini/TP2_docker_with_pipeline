pipeline {
    agent any

    stages {
        stage('Pull github code') {
            steps {
                // Clonez le dépôt GitHub contenant le code de votre application Maven Spring Boot
                git url: 'https://github.com/MariemKsontini/TP2_docker_with_pipeline'
            }
        }

        stage('Create a docker image of the project') {
            steps {
                // Utilisez un fichier Dockerfile existant pour construire l'image
                script {
                    def dockerImage = docker.build('monapp', '-f . .')
                }
            }
        }

        stage('Push of the image') {
            steps {
                // Connectez-vous à DockerHub (assurez-vous que les informations d'authentification sont configurées dans Jenkins)
                withDockerRegistry([credentialsId: 'PipelineID', url: 'https://registry.hub.docker.com']) {
                    // Poussez l'image vers DockerHub
                    sh 'docker monapp:tag'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed with success'
        }
        failure {
            echo 'Pipeline failed'
        }
    }
}

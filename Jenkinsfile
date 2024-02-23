pipeline {
    agent any

    stages {
        stage('Pull github code') {
            steps {
                // Clonez le dépôt GitHub contenant le code de votre application Maven Spring Boot
                git url: 'https://github.com/sllim637/TP_docker_with_pipeline.git'
            }
        }

        stage('Create a docker image of the project') {
            steps {
                // Utilisez un fichier Dockerfile existant pour construire l'image
                script {
                    def dockerImage = docker.build('product_management_app', '-f . .')
                }
            }
        }

        stage('Push of the image') {
            steps {
                // Connectez-vous à DockerHub (assurez-vous que les informations d'authentification sont configurées dans Jenkins)
                withDockerRegistry([credentialsId: 'votre-identifiant-de-credentials', url: 'https://registry.hub.docker.com']) {
                    // Poussez l'image vers DockerHub
                    sh 'docker push nom-de-votre-image:tag'
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

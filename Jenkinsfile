pipeline {
    agent any

    tools {
        // Ensure Maven is configured in Jenkins global tool configuration
        maven 'Maven' // The name of the Maven installation to use
    }

    stages {
        stage('Pull github code') {
            steps {
                git branch: 'main', url: 'https://github.com/MariemKsontini/TP2_docker_with_pipeline'
            }
        }
        
        stage('Build application') {
            steps {
                // Run Maven package to compile the code and package it into a .jar file
                sh 'mvn clean package'
            }
        }

        stage('Confirm Build Artifact') {
            steps {
                 sh 'ls -l target/'
            }
        }

        stage('Create a docker image of the project') {
            steps {
                script {
                    def dockerImage = docker.build('mariemksontini/monapp:latest', '.')
                }
            }
        }

        stage('Push of the image') {
            steps {
                withDockerRegistry([credentialsId: 'pipelineid', url: 'https://index.docker.io/v1/']) {
                    sh 'docker push mariemksontini/monapp:latest'
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

pipeline {
  agent any
  environment {
      APP_NAME = "test app name"
      IMAGE_NAME = "ghcr.io/jitpakornr/web"
  }
  stages {
      stage('Build Image'){
        steps {
          sh "echo ${env.APP_NAME}"
        }
      }
      stage('Build State (Docker)'){
        agent{label 'build-server'}
        steps {
            sh "docker build -t ${env.IMAGE_NAME} ."
        }
      }
      stage('Deliver Docker Image') {
            agent {label 'build-server'}
            steps {
                withCredentials(
                [usernamePassword(
                    credentialsId: 'jitpakornr',
                    passwordVariable: 'githubPassword',
                    usernameVariable: 'githubUsername'
                )]
            ){
                sh "docker login ghcr.io -u ${env.githubUsername} -p ${env.githubPassword}"
                sh "docker tag ${env.IMAGE_NAME} ${env.IMAGE_NAME}:${env.BUILD_NUMBER}"
                sh "docker push ${env.IMAGE_NAME}"
                sh "docker push ${env.IMAGE_NAME}:${env.BUILD_NUMBER}"
                sh "docker rmi ${env.IMAGE_NAME}"
                sh "docker rmi ${env.IMAGE_NAME}:${env.BUILD_NUMBER}"
            }
            }
        }
  }
}
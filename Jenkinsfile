pipeline {
  agent any
  environment {
      APP_NAME = "test app name"
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
            sh "docker build -t ghcr.io/jitpakornr/web ."
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
                sh "docker push ghcr.io/jitpakornr/web"
            }
            }
        }
  }
}
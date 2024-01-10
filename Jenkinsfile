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
  }
}
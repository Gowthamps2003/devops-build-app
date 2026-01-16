pipeline {
    agent any

    stages {
        stage('Build DEV') {
            when {
                branch 'dev'
            }
            steps {
                sh 'docker build -t yourdockerhub/app-dev:latest .'
                sh 'docker push yourdockerhub/app-dev:latest'
            }
        }

        stage('Build PROD') {
            when {
                branch 'master'
            }
            steps {
                sh 'docker build -t yourdockerhub/app-prod:latest .'
                sh 'docker push yourdockerhub/app-prod:latest'
            }
        }
    }
}

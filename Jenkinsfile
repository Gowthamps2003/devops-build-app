pipeline {
    agent any

    stages {
        stage('Build and Push Docker') {
            steps {
                script {
                    // Check which branch is being built
                    if (env.BRANCH_NAME == 'dev') {
                        echo "Building and pushing Docker image for DEV branch"
                        sh 'docker build -t yourdockerhub/app-dev:latest .'
                        sh 'docker push yourdockerhub/app-dev:latest'
                    } 
                    else if (env.BRANCH_NAME == 'main') {
                        echo "Building and pushing Docker image for PROD branch"
                        sh 'docker build -t yourdockerhub/app-prod:latest .'
                        sh 'docker push yourdockerhub/app-prod:latest'
                    } 
                    else {
                        echo "Branch not configured for Docker build: ${env.BRANCH_NAME}"
                    }
                }
            }
        }
    }
}

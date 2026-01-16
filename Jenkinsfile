pipeline {
    agent any

    stages {
        stage('Build and Push Docker') {
            steps {
                script {
                    def branch = env.BRANCH_NAME ?: env.GIT_BRANCH
                    echo "Detected branch: ${branch}"
                    
                    if (branch.contains('dev')) {
                        echo "Building and pushing Docker image for DEV branch"
                        sh 'docker build -t yourdockerhub/app-dev:latest .'
                        sh 'docker push yourdockerhub/app-dev:latest'
                    } 
                    else if (branch.contains('main')) {
                        echo "Building and pushing Docker image for PROD branch"
                        sh 'docker build -t yourdockerhub/app-prod:latest .'
                        sh 'docker push yourdockerhub/app-prod:latest'
                    } 
                    else {
                        echo "Branch not configured for Docker build: ${branch}"
                    }
                }
            }
        }
    }
}

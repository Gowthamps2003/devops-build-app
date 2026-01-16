pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')  // Your DockerHub credentials in Jenkins
    }

    stages {

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image..."
                    sh 'docker build -t gowthamps03/app:latest .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    def branch = env.BRANCH_NAME ?: env.GIT_BRANCH
                    echo "Detected branch: ${branch}"

                    // Login to DockerHub
                    sh '''
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                    '''

                    // Push dev image if branch is dev
                    if (branch.contains('dev')) {
                        echo "Pushing Docker image for DEV branch..."
                        sh 'docker tag gowthamps03/app:latest gowthamps03/dev:latest'
                        sh 'docker push gowthamps03/dev:latest'
                    }

                    // Push prod image if branch is main
                    else if (branch.contains('main')) {
                        echo "Pushing Docker image for PROD branch..."
                        sh 'docker tag gowthamps03/app:latest gowthamps03/prod:latest'
                        sh 'docker push gowthamps03/prod:latest'
                    }

                    else {
                        echo "Branch not configured for Docker push: ${branch}"
                    }
                }
            }
        }

        stage('Deploy to EC2') {
            when {
                expression { (env.BRANCH_NAME ?: env.GIT_BRANCH).contains('main') }
            }
            steps {
                echo "Deploying to EC2..."
                sh './deploy.sh'
            }
        }
    }
}

pipeline {
    agent any

    environment {
        IMAGE_NAME = 'student-admission-site'
        CONTAINER_NAME = 'admission-site'
        PORT_MAPPING = '8091:80' // Changed from 8090 to 8091
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat "docker build -t ${env.IMAGE_NAME} ."
            }
        }

        stage('Remove Existing Container') {
            steps {
                echo 'Removing existing Docker container if exists...'
                bat "docker rm -f ${env.CONTAINER_NAME} || exit 0"
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running new Docker container...'
                bat "docker run -d -p ${env.PORT_MAPPING} --name ${env.CONTAINER_NAME} ${env.IMAGE_NAME}"
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful. Visit: http://localhost:8091"
        }
        failure {
            echo "❌ Pipeline failed. Check logs for details."
        }
    }
}

pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'abode-webapp:1.0'
        CONTAINER_NAME = 'abode-webapp-jenkins'
        DOCKER_EXE = 'C:\\Users\\Amit\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'develop',
                    url: 'https://github.com/amitgrewal090-create/Abode-DevOps-Capstone.git'
            }
        }

        stage('Docker Build') {
            steps {
                bat '"%DOCKER_EXE%" build -t %DOCKER_IMAGE% .'
            }
        }

        stage('Application Test') {
            steps {
                bat '"%DOCKER_EXE%" run -d --name abode-test -p 18085:80 %DOCKER_IMAGE%'
                bat 'powershell.exe -NoProfile -Command "$r=Invoke-WebRequest http://localhost:18085 -UseBasicParsing; if($r.StatusCode -ne 200){exit 1}"'
            }
        }

        stage('Deploy') {
            steps {
                bat '"%DOCKER_EXE%" stop %CONTAINER_NAME% 2>nul || exit /b 0'
                bat '"%DOCKER_EXE%" rm %CONTAINER_NAME% 2>nul || exit /b 0'
                bat '"%DOCKER_EXE%" run -d --name %CONTAINER_NAME% -p 8085:80 %DOCKER_IMAGE%'
            }
        }
    }

    post {
        always {
            bat '"%DOCKER_EXE%" rm -f abode-test 2>nul || exit /b 0'
        }
        success {
            echo 'Abode DevOps CI/CD Pipeline completed successfully!'
        }
        failure {
            echo 'Abode DevOps CI/CD Pipeline failed!'
        }
    }
}

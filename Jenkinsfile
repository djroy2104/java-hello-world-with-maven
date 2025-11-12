pipeline {
    agent any

    tools {
        maven 'maven8.9.11'
        jdk 'java17'
    }

    stages {
        stage('Checkout') {
            steps {
                git(branch: 'master', url: 'https://github.com/djroy2104/java-hello-world-with-maven.git')
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

    }

    post {
        success {
            echo 'Build completed successfully!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}


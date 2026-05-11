pipeline {
    agent any

    tools {
        maven 'MAVEN_HOME'
        jdk 'JAVA_HOME'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master',
                url: 'https://github.com/djroy2104/java-hello-world-with-maven.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy JAR to Nexus') {
            steps {
                sh 'mvn deploy'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh '''
                    cp target/jb-hello-world-maven-0.2.0.jar app.jar
                    docker build -t djroy45/shop:1 .
                    '''
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                withDockerRegistry(
                    credentialsId: 'docker-hub-credentials',
                    url: 'https://index.docker.io/v1/'
                ) {

                    sh 'docker push djroy45/shop:1'
                }
            }
        }

        stage('Deploy to EC2 using Ansible') {
            steps {
                ansiblePlaybook(
                    playbook: '/var/lib/jenkins/workspace/deploy-container.yml',
                    inventory: '/var/lib/jenkins/workspace/inventory.ini',
                    extras: '-e "ansible_ssh_private_key_file=121.pem"'
                )
            }
        }
    }
}


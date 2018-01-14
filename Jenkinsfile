pipeline {
    agent any

    stages {
        stage ('Build Docker Image') {
            steps {
                sh "/var/jenkins_home/docker build -t hello-world:jenkins ."
            }
        }
    }
}

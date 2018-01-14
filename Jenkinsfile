pipeline {
    agent any

    stages {
        stage ('Build Docker Image') {
            steps {
                sh "/var/jenkins_home/docker/docker -H pipeline-lab01:2376 build -t hello-world:jenkins ."
            }
        }
    }
}

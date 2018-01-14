pipeline {
    agent any
    environment {
        PATH="$PATH:/var/jenkins_home/docker/"
    }
    stages {
        stage ('Build Docker Image') {
            steps {
                script {
                    /* This builds the actual image; synonymous to docker build on the command line */
                    docker.withServer('tcp://pipeline-lab01:2376') {
                    docker.build("hello-world:jenkins2") }
                }
            }
        }
    }
}

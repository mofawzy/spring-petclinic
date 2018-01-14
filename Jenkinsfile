pipeline {
    agent any

    stages {
        stage ('Build Docker Image') {
            steps {
                script {
                    withDockerServer([uri: "tcp://pipeline-lab01:2376"]) {
                        /* This builds the actual image; synonymous to docker build on the command line */
                        docker.build("hello-world:jenkins")
                    }
                }
            }
        }
    }
}

pipeline {
    agent any
       stages {
        stage ('Build Docker Image') {
            steps {
                script {
                    /* This builds the actual image; synonymous to docker build on the command line */
                    docker.withServer('tcp://pipeline-lab01:2376') {
                    docker.build("petclinic:1") 
                    } 
                }
            }
        }
    }
}

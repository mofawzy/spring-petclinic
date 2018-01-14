pipeline {
    agent any

    stages {
        stage('Build and Quality Check') {
            steps {
                withSonarQubeEnv('sonarqube') {
                sh '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/Maven-3.5.2/bin/mvn clean install sonar:sonar' 
                }
                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true 
            }
        }
        stage ('Publish to Nexus') {
            steps {
                sh 'echo current working dir: $(pwd)'
                nexusArtifactUploader (
                    artifacts: [
                        [artifactId: 'petclinic', 
                        classifier: 'SNAPSHOT', 
                        file: 'target/spring-petclinic-1.5.1.jar',
                        type: 'jar']
                    ], 
                    credentialsId: 'nexusCredentials', 
                    groupId: 'petclinic-pipeline', 
                    nexusUrl: 'pipeline-lab01:8081', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: 'PetClinic/', 
                    version: "1.${env.BUILD_ID}"
                )
            }
        }
        stage ('Build Docker Image') {
            
                /* This builds the actual image; synonymous to docker build on the command line */
                docker.build("mofawzy/spring-petclinic")
            
        }
    }
}

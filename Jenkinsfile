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
            nexusArtifactUploader (
                artifacts: [
                    [artifactId: 'petclinic', 
                     classifier: '', 
                     file: 'spring-petclinic-1.5.1.jar', 
                     type: 'jar']
                ], 
                credentialsId: '', 
                groupId: 'petclinic-pipeline', 
                nexusUrl: 'pipeline-lab01:8081', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: '/PetClinic', 
                version: '3.7'
            )
            
        }
    }
}

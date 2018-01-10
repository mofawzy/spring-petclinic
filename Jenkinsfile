pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/Maven-3.5.2/bin/mvn build clear sonar:sonar' 
                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true 
            }
        }
    }
}
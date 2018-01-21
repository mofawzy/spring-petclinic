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
                steps {
                	script {
                	    try {
	                    	    sh "docker -H pipeline-lab01:2376 run --rm -i lukasmartinelli/hadolint < Dockerfile"                	
                    	    }
                    	catch (exc) {
                    	      	echo "Warning: Dockerfile failed quality checks"
                    	        
                    	      }
                	    
                	}

                    script {
                        /* This builds the actual image; synonymous to docker build on the command line */
       	               
           	            docker.withRegistry ('https://hub.docker.com','dockerHub-credentials') {
			   	            docker.withServer('tcp://pipeline-lab01:2376') {
            		            def customImage = docker.build("mobayomie/petclinic:1") 
      		                    customImage.push()
                	   	    } 
   	    	        
                    	}
                    }
                }
            }
            stage ('Start Container') {
                steps {
                    sh "docker -H pipeline-lab01:2376 run -d -p 7070:8080 --name petclinic petclinic:1"
                }
            }
    }
}

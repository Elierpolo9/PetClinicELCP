pipeline {
    agent { label 'JDK11_MVN_SONAR_JFROG' }
    triggers { 
        cron('45 23 * * 1-5')
        pollSCM('*/5 * * * *')
    }
	tools {
		maven 'MVN_3.8.5'
	}
    stages {
        stage('scm') {
            steps {
               
                git url: 'https://github.com/GitPracticeRepo/spring-petclinic.git', branch: 'declarative'
            }
        }
        stage('build') {
            steps {
                withSonarQubeEnv(installationName: 'SONAR_9.4.0') {
                    sh "mvn clean package sonar:sonar"                                  
                }
            }
        }
		stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
                    // true = set pipeline to UNSTABLE, false = don't
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}

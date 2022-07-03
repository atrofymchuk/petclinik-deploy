pipeline {
    agent {
        label "master"
    }
    tools {
     maven 'maven'
    }
    environment {
        NEXUS_CREDENTIAL_ID = credentials('nexus-user-credentials')
    }
   stages {
     stage('Download artifact Nexus Repository Manager') {
       steps {
         sh 'wget --user=$NEXUS_CREDENTIAL_ID_USR --password=$NEXUS_CREDENTIAL_ID_PSW "https://nexus-lab.pp.ua/service/rest/v1/search/assets/download?repository=maven-lab&name=spring-petclinic&sort=version"'
         sh 'ls -la'
       }
     }
   }
}

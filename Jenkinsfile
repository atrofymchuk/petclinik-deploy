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
         sh 'wget --user=$NEXUS_CREDENTIAL_ID_USR --password=$NEXUS_CREDENTIAL_ID_PSW "https://nexus-lab.pp.ua/repository/maven-lab/org/springframework/samples/spring-petclinic/2.7.2-SNAPSHOT/spring-petclinic-2.7.2-20220701.052309-1.jar"'
         sh 'ls -la'
       }
     }
   }
}

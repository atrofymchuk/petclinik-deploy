pipeline {
    agent {
        label "master"
    }
    tools {
     maven 'maven'
    }
     environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "https"
        NEXUS_URL = "nexus-lab.pp.ua"
        NEXUS_REPOSITORY = "maven-lab"
        NEXUS_CREDENTIAL_ID = "nexus-user-credentials"
        MAVEN_REPO = "maven-lab"
        GROUP_ID = "org.springframework.samples"
        ARTIFACT_ID = "spring-petclinic"
        VERSION = "2.7.3-SNAPSHOT"
        FILE_EXTENSION = "jar"
    }
   stages {
     stage('Download artifact Nexus Repository Manager') {
       steps {
         sh '''#!/bin/bash
               echo $NEXUS_CREDENTIAL_ID_USR
               echo $NEXUS_CREDENTIAL_ID_PSW
         '''
       }
     }
   }
}

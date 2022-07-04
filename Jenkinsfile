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
        MAVEN_REPO = maven-lab
        GROUP_ID = org.springframework.samples
        ARTIFACT_ID = spring-petclinic
        VERSION = "2.7.3-SNAPSHOT"
        FILE_EXTENSION = jar
    }
   stages {
     stage('Download artifact Nexus Repository Manager') {
       steps {
         sh 'curl --user $NEXUS_CREDENTIAL_ID_USR:$NEXUS_CREDENTIAL_ID_PSW -X GET "${NEXUS_URL}/service/rest/v1/search/assets?repository=${MAVEN_REPO}&maven.groupId=${GROUP_ID}&maven.artifactId=${ARTIFACT_ID}&maven.baseVersion=${VERSION}&maven.extension=${FILE_EXTENSION}" -H  "accept: application/json"  > version.json'
       }
     }
   }
}

pipeline {
    agent {
        label "master"
    }
    tools {
     maven 'maven'
    }
     environment {
        NEXUS_URL = "https://nexus-lab.pp.ua"
        NEXUS_REPOSITORY = "maven-lab"
        NEXUS_CREDENTIAL_ID = "nexus-user-credentials"
        MAVEN_REPO = "maven-lab"
        GROUP_ID = "org.springframework.samples"
        ARTIFACT_ID = "spring-petclinic"
        VERSION = "2.7.3-SNAPSHOT"
        FILE_EXTENSION = "jar"
    }
   stages {
        stage ('Define  variables'){
           steps {
              script {
                env.deploy_pom_version = "NOT DEFINED VERSION"
                env.deploy_pom_artifactid = "NOT DEFINED ARTIFACTID"
                env.deploy_pom_groupid = "NOT DEFINED GROUPID"
                env.deploy_pom_packaging = "NOT DEFINED PACKAGING"
                
              }
           }  
        }
        stage('inject variables') {
           steps {
             script {
               
               def vars = variables.getBuildVariables()
                //println "found variables" + vars
               env.deploy_pom_version = vars.build_pom_version
               env.deploy_pom_artifactid = vars.build_pom_artifactid
               env.deploy_pom_groupid = vars.build_pom_groupid 
               env.deploy_pom_packaging = vars.build_pom_packaging
             }
           }
        }
        stage('next job') {
            steps {
              echo "version = ${env.deploy_pom_version}"
              echo "artifactid = ${env.deploy_pom_artifactid}"
              echo "groupid = ${env.deploy_pom_groupid}"
              echo "groupid = ${env.deploy_pom_packaging}"
            }
        }
        stage('Download artifact Nexus Repository Manager') {
           steps {
              withCredentials([usernamePassword(credentialsId: 'nexus-user-credentials', passwordVariable: 'PASSWD', usernameVariable: 'USER')]) {
                 sh '''#!/bin/bash
                     download_url=$(curl --user $USER:$PASSWD -X GET "${NEXUS_URL}/service/rest/v1/search/assets?repository=${MAVEN_REPO}&maven.groupId=${GROUP_ID}&maven.artifactId=${ARTIFACT_ID}&maven.baseVersion=${VERSION}&maven.extension=${FILE_EXTENSION}" -H  "accept: application/json"  | jq -rc '.items | .[].downloadUrl' | sort | tail -n 1)
                     wget --user=\$USER --password=\$PASSWD $download_url
                    '''
              }    
           }
        }
   }
}

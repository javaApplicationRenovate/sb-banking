pipeline {
    agent any
    environment {
        CI = 'true'
        CODE_SOURCE_DIR_IN_WORKSPACE="src"
        CONTAINER_BIN="docker"
        GIT_BIN="git"
        DIR_FILES="data"
    }
    stages {
        stage('Build') {
            steps {
                println "Build WORKSPACE ${WORKSPACE}"
                println "JOB_NAME ${JOB_NAME}"
                println "GIT_URL: ${GIT_URL}"
                println "WORKSPACE: ${WORKSPACE}"
                println "BUILD_NUMBER: ${BUILD_NUMBER}"
                println "CODE_SOURCE_DIR_IN_WORKSPACE: ${CODE_SOURCE_DIR_IN_WORKSPACE}"
                println "ENTERPRISE_CONTAINER_BUILD_REPO: ${ENTERPRISE_CONTAINER_BUILD_REPO}"
                println "CI_ENV_TARGET: ${CI_ENV_TARGET}"
                println "CONCERT_URL: ${CONCERT_URL}"
                println "CONCERT_INSTANCE_ID: ${CONCERT_INSTANCE_ID}"
                println "CONCERTCTL_CMDB_URL: ${CONCERTCTL_CMDB_URL}"
                println "CONCERT_USERNAME: ${CONCERT_USERNAME}"
                println "CONCERT_PASSWORD: ${CONCERT_PASSWORD}"
                println "CONTAINER_BIN: ${CONTAINER_BIN}"
                println "GIT_BIN: ${GIT_BIN}"
                println "DIR_FILES: ${DIR_FILES}"
                println "DOCKER_HOST: ${DOCKER_HOST}"
                sh '''
                ls -al && pwd
                ./mvnw clean install -DskipTests=true
                docker build -t "sb-banking:${BUILD_NUMBER}" .
                docker images
                '''
            }
        }
        stage('Generate Application SBOM') {
            steps{
              script{
                  sh "/var/lib/jenkins/lib/concert_ctl_python --app --env"
              }
          }
        }
    }
}

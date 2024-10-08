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
                sh '''
                ls -al && pwd
                ./mvnw clean install -DskipTests=true
                docker build -t "spring-boot-banking:latest" .
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

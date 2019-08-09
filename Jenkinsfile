pipeline {
    agent { docker { image 'google/dart'} }
    stages {
        stage ('Step 0: Configure custom path') {
            def jobPath = "/home/lain/jenkinsJobs/${env.JOB_NAME}/${env.BUILD_NUMBER}"
        }
        stage('build') {
            steps {
                ws(jobPath) {
                    sh '/usr/bin/dart --version'
                }
            }
        }

        stage('test') {
            steps {
                ws(jobPath) {
                    sh 'pub get'
                    sh '/usr/bin/dart bin/main.dart -d 15 -w "https://google.com" -u 5'
                }
            }
        }
    }
}
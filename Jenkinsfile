pipeline {
    agent { docker { image 'google/dart'} }
    stages {
        stage('build') {
            steps {
                sh '/usr/bin/dart --version'
            }
        }

        stage('test') {
            steps {
                sh '/usr/bin/dart bin/main.dart -d 15 -w "https://google.com" -u 5'
            }
        }
    }
}
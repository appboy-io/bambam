pipeline {
    agent { docker { image 'google/dart'} }
    stages {
        stage('build') {
            steps {
                sh '/usr/bin/dart --version'
            }
        }
    }
}
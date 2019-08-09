node {
    try {
        stage('Checkout') {
            checkout scm
        }

        stage('Environment') {
            echo "Branch: ${env.BRANCH_NAME}"
            sh 'docker -v'
            sh 'printenv'
        }

        stage('Build Docker Image') {
            sh 'docker build -t bambam .'
        }

        stage('Test Docker Image') {
            sh 'docker run -e DURATION=10 --rm bambam'
        }

        stage('Remove Docker Image from local') {
            sh 'docker rmi bambam'
        }
    }
    catch(err) {
        throw err
    }
}
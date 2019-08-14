node {
    try {
        stage('Checkout') {
            checkout scm
            registry = "humancaching/bambam"
            registryCredential = 'humancaching_dockerhub'
        }

        stage('Environment') {
            echo "Branch: ${env.BRANCH_NAME}"
            sh 'docker -v'
            sh 'printenv'
        }

        stage('Build Docker Image') {
            bambamImage = docker.build registry
        }

        stage('Test Docker Image') {
            sh "docker run -e DURATION=10 --rm $registry"
        }

        stage('Push to Docker Repository') {
            docker.withRegistry('', registryCredential) {
                bambamImage.push("$BUILD_NUMBER")
                bambamImage.push("latest")
            }    
        }

        stage('Remove Docker Image from local') {
            sh "docker rmi $registry"
        }
    }
    catch(err) {
        throw err
    }
}
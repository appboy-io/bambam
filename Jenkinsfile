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
            def bambamImage = docker.build registry + ":$BUILD_NUMBER"
        }

        stage('Test Docker Image') {
            sh 'docker run -e DURATION=10 --rm bambam'
        }

        stage('Push to Docker Repository') {
            steps{
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Remove Docker Image from local') {
            sh "docker rmi $registry:$BUILD_NUMBER"
        }
    }
    catch(err) {
        throw err
    }
}
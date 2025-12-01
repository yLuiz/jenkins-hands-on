pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    dockerapp = docker.build("yluizv/jenkins-hands-on:${env.BUILD_ID}", "-f ./src/Dockerfile ./src")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') { // 'dockerhub' is the ID of the Docker Hub credentials stored in Jenkins
                        dockerapp.push('latest')
                        dockerapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }
        stage('Deploy no Kubernetes') {
            steps {
                echo 'Deploying...'
            }

            steps {
                echo 'Deploy step would go here (requires Kubernetes cluster and configuration)'
            }
            
            // Adicionando etapa de deploy no Kubernetes (necessita do plugin Kubernetes CLI)
            // Não tenho um cluster k8s para testar, então o código é apenas ilustrativo
            /* 
            steps {
                withKubeConfig([credentialsId: 'kubeconfig', serverUrl: 'https://your-k8s-api-server']) {
                    sh 'kubectl apply -f k8s/deployment.yaml'
                }
            } 
            */
            
        }
    }
}

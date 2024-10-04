pipeline {
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')  // Docker Hub credentials stored in Jenkins
        DOCKER_IMAGE = "ujjwalk20/cust_seg_app"
        DOCKER_TAG = "latest"
        REPO_URL = "https://github.com/ujjwalk20/Customer_Segmentation.git"
       
    }
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using Docker plugin
                    dockerImage = docker.build("-t test_streamlit_app1")
                    dockerImage = docker.build("test_streamlit_app1")
                }
            }
        }

tage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Use credentials for Docker Hub login
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                            // Push the Docker image to Docker Hub
                            docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                        }
                    }
                }
            }
        }
        // stage('Run Docker Container') {
        //     steps {
        //         script {


        //             // Run the new container using Docker plugin
        //             docker.image("test_streamlit_app1").run('-p 8501:8501 ')
        //         }
        //     }
        // }
    }
}
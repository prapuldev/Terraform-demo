pipeline {
    agent any

    parameters {
        string(name: 'BUILD_ID', defaultValue: '', description: 'Build ID from React job')
    }

    environment {
        TF_DIR = 'Infra-repo/terraform'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/prapuldev/Terraform-demo.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform init -input=false'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TF_DIR}") {
                    sh "terraform plan -input=false -out=tfplan -var=\"build_id=${BUILD_ID}\""
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${TF_DIR}") {
                    sh "terraform apply -auto-approve tfplan -var=\"build_id=${BUILD_ID}\""
                }
            }
        }

    }
}

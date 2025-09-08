pipeline {
    agent any
    parameters {
        string(name: 'BUILD_ID', defaultValue: '0', description: 'Build ID from App Pipeline')
    }
    stages {
        stage('Terraform Init & Apply') {
            steps {
                dir("terraform") {
                    sh """
                    terraform init -input=false
                    terraform apply -auto-approve -var="build_id=${params.BUILD_ID}"
                    """
                }
            }
        }
        stage('Show Output File') {
            steps {
                sh "cat terraform/output.txt"
            }
        }
    }
}

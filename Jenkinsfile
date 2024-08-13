pipeline {
    agent any
    parameters {
        choice(name: 'SERVICE', choices: ['EKS', 'ECS'], description: 'Select the service to deploy')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'test', 'stage'], description: 'Select the deployment environment')
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'feature/eks-setup', credentialsId: 'GitHub_Personal access token', url: 'https://github.com/org/devops-terraform.git'
            }
        }

        stage('Initialize Terraform') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    sh 'terraform init'
                }
            }
        }
        stage('Plan Terraform') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    script {
                        if (params.SERVICE == 'EKS') {
                            sh 'terraform plan -var-file=terraform.tfvars -target=module.eks_${params.ENVIRONMENT}'
                        } else {
                            sh 'terraform plan -var-file=terraform.tfvars -target=module.ecs_fargate${params.ENVIRONMENT}'
                        }
                    }
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    script {
                        if (params.SERVICE == 'EKS') {
                            sh 'terraform apply -auto-approve -var-file=terraform.tfvars -target=module.eks_${params.ENVIRONMENT}'
                        } else {
                            sh 'terraform apply -auto-approve -var-file=terraform.tfvars -target=module.ecs_fargate${params.ENVIRONMENT}'
                        }
                    }
                }
            }
        }

        stage('Approval for Destroy') {
            steps {
                script {
                    def userInput = input(
                        id: 'confirm', message: 'Do you want to destroy resources?',
                        parameters: [choice(name: 'CONFIRM_DESTROY', choices: ['yes', 'no'], description: 'Confirm Destroy' )]
                    )
                    if (userInput == 'no') {
                        error("User Cancelled to destroy")
                    }
                }
               
            }
        }

        stage('Destroy Terraform') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    script {
                        if (params.SERVICE == 'EKS') {
                            sh 'terraform destroy -auto-approve -var-file=terraform.tfvars -target=module.eks_${params.ENVIRONMENT}'
                        } else {
                            sh 'terraform destroy -auto-approve -var-file=terraform.tfvars -target=module.ecs_fargate${params.ENVIRONMENT}'
                        }
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
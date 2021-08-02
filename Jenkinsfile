
pipeline {

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')

    }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

  agent  any
        options {
                timestamps ()
               
            }
    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            git "https://github.com/Abishek-Ravichander/aws-instance-first-script-new.git"
                        }
                    }
                }
            }

        stage('Plan') {
            steps {
                bat 'cd&cd terraform/aws-instance-first-script-new & terraform init -input=false'
                bat 'cd&cd terraform/aws-instance-first-script-new & terraform workspace new terraform_13'
                bat 'cd&cd terraform/aws-instance-first-script-new & terraform workspace select terraform_13'
                bat "cd&cd terraform/aws-instance-first-script-new & terraform plan -input=false -out tfplan "
                bat 'cd&cd terraform/aws-instance-first-script-new & terraform show -no-color tfplan > tfplan.txt'
            }
        }
       

        stage('Apply') {
            steps {
                bat "cd&cd terraform/aws-instance-first-script-new & terraform apply -input=false tfplan"
            }
        }
    }

  }

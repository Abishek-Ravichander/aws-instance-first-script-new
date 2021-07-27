
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
                bat 'cd&cd terraform/aws-instance-first-script & terraform init -input=false'
                bat 'cd&cd terraform/aws-instance-first-script & terraform workspace new ${environment}'
                bat 'cd&cd terraform/aws-instance-first-script & terraform workspace select ${environment}'
                bat "cd&cd terraform/aws-instance-first-script & terraform plan -input=false -out tfplan "
                bat 'cd&cd terraform/aws-instance-first-script & terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'terraform/aws-instance-first-script/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                bat "cd&cd terraform/aws-instance-first-script & terraform apply -input=false tfplan"
            }
        }
    }

  }

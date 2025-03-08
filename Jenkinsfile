pipeline {
    agent { label 'slave' }
    tools {
        maven 'maven3'
        jdk 'jdk-17'
    }
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
        }


    stages {
        stage('Git Checkout') {
            steps {
                echo 'Git Cloning .....'
                git branch: 'main', url: 'https://github.com/sonbarse17/springboot-demo.git'
                echo 'Git Cloning Done .....'
            }
        }
        stage('maven compile') {
            steps {
                echo '*************** Compiling code with Maven **********'
                sh 'mvn compile'
                echo '*************** Compiling code with Maven Done **********'
            }
        }
        stage('sonar scan') {
            steps {
                echo 'Scanning Code with SonarQube ....................'
                script {
                    withSonarQubeEnv(credentialsId: 'sonar-token') {
                        sh '''$SCANNER_HOME/bin/sonar-scanner \
                            -Dsonar.projectName=springboot \
                            -Dsonar.projectKey=springboot \
                            -Dsonar.java.binaries=target'''
                    }
                }
                echo 'Scanning Code with SonarQube Done ....................'
            }
        }
        stage("OWASP Dependency Check") {
            steps {
                echo '********** Checking Dependencies **************'
                
                script {
                    withCredentials([string(credentialsId: 'NVD_API_KEY', variable: 'NVD_API_KEY')]) {
                        sh '''
                            mvn org.owasp:dependency-check-maven:check \
                            -DnvdApiKey=${NVD_API_KEY} \
                            -Dformat=HTML
                        '''
                    }
                }
                
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'

                echo '********** Checking Dependencies Done **************'
            }
        }
    
        stage('maven build') {
            steps {
                echo '***** Building with Maven ********'
                sh 'mvn package'
                echo '***** maven Built ********'
            }
        }
        stage('docker build and tag') {
            steps {
                echo '***** Building Docker image *******'
                script {
                    sh 'sudo docker build -t sonbarse17/springboot:1.0 .'
                }
                echo '***** Docker image Builed Successful*******'
            }
        }
        stage('trivy') {
            steps {
                echo '*************** Scanning Image with Trivy **************************'
                sh 'trivy image sonbarse17/springboot:1.0 --format table -o image.html'
                echo '************** Image Successfully Scanned By Trivy ******************'
            }
        }
        stage('docker push') {
            steps {
                echo '******** Pushing Image to DockerHub *********'
                script {
                    withDockerRegistry(credentialsId: 'dockerhub') {
                        sh 'sudo docker push sonbarse17/springboot:1.0'
                    }
                }
                echo '******** Successfully Pushed Image To DockerHub **********'
            }
        }


        stage('docker run') {
            steps {
                echo '***** Running Docker Container *******'
                script {
                    sh 'sudo docker run -d -p 8080:8080 sonbarse17/springboot:1.0'
                }
                echo '***** Running Docker Container *******'
            }
        }
    }
}

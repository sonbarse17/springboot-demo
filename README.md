# springboot-demo Implementation
## Result
![image](https://github.com/user-attachments/assets/5012f3c8-5ed9-4f28-8ae7-25abb2b2fcac)

## 1. Run in the Local
### Requirement
Installing Java 17:
    sudo yum install java-17 -y

Installing Maven:
    
    sudo yum update
    sudo yum install maven -y



Clean and Install the Project:

    mvn clean package

Run the Application:
Or, navigate to the target directory and run the packaged JAR file:
    
    cd target
    java -jar sendevops-0.0.1-SNAPSHOT.jar


Build Issues:
If the build fails, run Maven with detailed logging to diagnose the problem:

    mvn clean install -X

## 2. Run in Docker

Building and Running the Docker Image

        docker build -t springboot-app .

Run the Docker Container:

        docker run -p 8080:8080 springboot-app:latest


#### Run On Jenkins ######


Steps to Install This Project

Step 1 : Install java-17 , maven , git , and trivy on your Slave ... 
        sudo yum install docker maven git java-17 -y 
        sudo systemctl enable --now docker
        sudo useradd jenkins 
        sudo usermod -aG docker jenkins && newgrp docker

rpm -ivh https://github.com/aquasecurity/trivy/releases/download/v0.41.0/trivy_0.41.0_Linux-64bit.rpm

sudo docker run -d --name sonar -p 9000:9000 sonarqube:lts-community

// default sonar login 
//username: admin
//password: admin



Step 2: Install Jenkins on your Master ......

        sudo yum update –y
        sudo wget -O /etc/yum.repos.d/jenkins.repo \
                https://pkg.jenkins.io/redhat-stable/jenkins.repo
        sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
        sudo yum upgrade
        sudo dnf install java-17-amazon-corretto -y
        sudo yum install jenkins -y
        sudo systemctl enable jenkins
        sudo systemctl start jenkins
        sudo cat /var/lib/jenkins/secrets/initialAdminPassword

Step 3: Configure Jenkins on your Master ......

Step 4: install plugins
   eclipse temurin , docker ,   maven, sonarqube , OWASP

Step 5: Setup credintials in jenkins 

docker and sonarqube 

step 6: setup tools jenkins

JDK installation 

name : jdk-17
install automatically
- install from adoptium.net 
  - version : jdk-17.0.11+9


SonarQube Scanner Installations

Name : sonar-scanner 
install automatically


Maven installations

name : maven3 
install automatically 

Dependancy Check 

name : dp-check
install automatically 
- install from github


step 7: setup sonarqube on jenkins
navigate to dashbord > manage jenkins > system > SonarQube installtions 

Name : sonar-server 
server URL : 
server Authentication token : 
apply and save


nvd api key
step 8 :
navigate to sonarqube dashonboard > projects > new project locally > provide token > other > linux 


step 8: create pipeline

name : devsecops

discard old build 
 - max : 2




        

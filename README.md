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

        docker build -t sendevops:latest .

Run the Docker Container:

        docker run -p 8080:8080 sendevops:latest

        

# springboot-demo
## Run in the Local
Clean and Install the Project:

    mvn clean install


Compile the Project:

    mvn compile

Build the Project:

    mvn package

Run the Application:
Or, navigate to the target directory and run the packaged JAR file:
    
    cd target
    java -jar sendevops-0.0.1-SNAPSHOT.jar


Build Issues:
If the build fails, run Maven with detailed logging to diagnose the problem:

    mvn clean install -X

## Run in Docker

Building and Running the Docker Image

        docker build -t sendevops:latest .

Run the Docker Container:

        docker run -p 8080:8080 sendevops:latest

        

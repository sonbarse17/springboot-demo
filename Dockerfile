# Stage 1: Build the application using Maven
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Set working directory
WORKDIR /app

# Copy pom.xml and download dependencies first (for better caching)
COPY pom.xml ./
RUN mvn dependency:go-offline

# Copy the entire project and build the application
COPY . .  
RUN mvn clean package -DskipTests

# Stage 2: Create a lightweight runtime image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the built JAR file from the builder stage
COPY --from=builder /app/target/sendevops-0.0.1-SNAPSHOT.jar app.jar

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

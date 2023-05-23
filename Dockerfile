# Use a base image with Java 8 installed
FROM openjdk:8-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the Spring Boot application JAR file to the container
COPY target/platform-0.0.1-SNAPSHOT.jar app.jar

# Expose the port on which the Spring Boot application will run (change it if necessary)
EXPOSE 8080

# Set the entry point command to run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"] 


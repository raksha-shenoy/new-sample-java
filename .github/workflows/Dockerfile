# Example Dockerfile
# Use an official OpenJDK runtime as a base image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container at /app
COPY target/java.jar /app/java.jar

# Specify the command to run on container startup
CMD ["java", "-jar", "java.jar"]

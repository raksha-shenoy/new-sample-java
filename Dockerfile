# Example Dockerfile
#FROM ubuntu:latest
#LABEL maintainer="raksha-shenoy rakshha3@gmail.com"
# Use an official OpenJDK runtime as a base image
#FROM openjdk:11-jre-slim

# Set the working directory inside the container
#WORKDIR /app

# Copy the JAR file into the container at /app
#COPY target/java.jar /app/java.jar

# Specify the command to run on container startup
#CMD ["java", "-jar", "java.jar"]
# Example Dockerfile


# Your Docker image setup goes here

# Use an official Maven image as a build environment
FROM maven:3.8.6-openjdk-11-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the project files and directories to the container
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean install
RUN mvn clean package

# Create a final image for running the application
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the build environment to the final image
COPY --from=build /App/target/java.jar ./app.jar

# Specify the command to run on container startup
CMD ["java", "-jar", "app.jar"]


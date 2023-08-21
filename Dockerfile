FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y

# Set the working directory to /app
WORKDIR /app

# Copy the Maven Wrapper script and build files
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Copy the rest of the application
COPY src src

# Make the Maven Wrapper script executable
RUN chmod +x mvnw

# Build the application
RUN ./mvnw clean package -DskipTests

FROM openjdk:17-jdk-slim

EXPOSE 8080

# Update the path to match the actual built JAR file name
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]

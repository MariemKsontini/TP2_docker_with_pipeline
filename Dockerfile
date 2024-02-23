# Use the official OpenJDK base image for Java 11
FROM openjdk:11

# Set the working directory in the container
WORKDIR /app

# Copy the Spring Boot JAR file into the container at /app
COPY target/ob-item-service-0.0.1-SNAPSHOT.jar /app/ob-item-service-0.0.1-SNAPSHOT.jar

# Expose the port that your Spring Boot application will run on
EXPOSE 8081

# Command to run your Spring Boot application
CMD ["java", "-jar", "ob-item-service-0.0.1-SNAPSHOT.jar"]
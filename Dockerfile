FROM openjdk:17-jdk-slim

# Create working directory
WORKDIR /app

# Copy JAR file
COPY app.jar app.jar

# Expose application port
EXPOSE 8080

# Run application
CMD ["java", "-jar", "app.jar"]

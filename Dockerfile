# Use a base image that includes JDK for building and running the application
FROM gradle:7.5.1-jdk17

# Set the working directory in the container
WORKDIR /app

# Copy the gradle files and the source code
COPY build.gradle settings.gradle gradlew ./
COPY gradle gradle
COPY src src

# Expose the application port
EXPOSE 8090

# Run the application using `bootrun`
CMD ["./gradlew", "bootrun"]

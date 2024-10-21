# Use Gradle with JDK 17 for building the application.
FROM gradle:7.6.0-jdk17 AS build  

# Set the working directory inside the container.
WORKDIR /app  

# Copy all application files into the container's /app directory.
COPY . .  

# Run the Gradle build, skipping tests.
RUN ./gradlew clean build -x test  


# Use a slim JDK image for a smaller final runtime image.
FROM openjdk:17-jdk-slim  

# Set the working directory for the runtime environment.
WORKDIR /app  

# Copy the built JAR from the build stage.
COPY --from=build /app/build/libs/pet-clinic.jar app.jar  

# Specify the port that the Spring Boot app will run on.
EXPOSE 8090  

# Define the command to run the JAR when the container starts.
ENTRYPOINT ["java", "-jar", "app.jar"]

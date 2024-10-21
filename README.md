Pet Clinic Project
Hello, everyone! Welcome to the repository for the Pet Clinic project. This project demonstrates how to build and Dockerize a Spring Boot application. Below, you'll find instructions for running the application locally and using Docker, as well as integrating SonarQube for code quality checks.

Project Overview
In this tutorial, we will cover the following topics:

Running the Project Locally
Get the Spring Boot application up and running on your local machine.

Dockerizing the Application
Write a Dockerfile and create a Docker image to run the Spring Boot application in a container.

Running the Application in a Docker Container
Build and run the Docker container, making the application accessible through a specified port.

Integrating SonarQube for Code Analysis
Set up SonarQube to analyze your codebase and perform quality checks.

Prerequisites
Make sure you have the following installed on your machine:

Java 17
Gradle
Docker
SonarQube (for code analysis)
Getting Started
Cloning the Repository
Clone the repository from my GitHub account:

bash
Copy code
git clone https://github.com/your-github-account/pet-clinic.git
cd pet-clinic
Running the Application Locally
To run the Spring Boot application on your local machine:

Navigate to the project directory:

bash
Copy code
cd ~/workspace/Pet-Clinic
Use the following command to build and run the project:

bash
Copy code
./gradlew bootrun
The application will start using Java 17 and run on port 8090 by default. Access it by navigating to http://localhost:8090 in your web browser.

Dockerizing the Application
Create a Dockerfile in the root of your project:

dockerfile
Copy code
# Use an OpenJDK base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the build files to the container
COPY build/libs/pet-clinic-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8090
EXPOSE 8090

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
Build the Docker image:

bash
Copy code
docker build -t pet-clinic .
Run the Docker container:

bash
Copy code
docker run -p 8090:8090 pet-clinic
The application will now be accessible at http://localhost:8090.

Integrating SonarQube
Ensure SonarQube is running locally or on a server.

Update build.gradle to include the SonarQube plugin:

gradle
Copy code
plugins {
    id "org.sonarqube" version "4.0"
}
Run the SonarQube analysis:

bash
Copy code
./gradlew sonarqube \
  -Dsonar.projectKey=pet-clinic \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=your-sonar-token
Replace your-sonar-token with your actual SonarQube token.

Contributing
Feel free to fork this repository, make changes, and submit a pull request. All contributions are welcome!

License
This project is licensed under the MIT License.

Contact
For any questions or feedback, please reach out to me via email: your-email@example.com.


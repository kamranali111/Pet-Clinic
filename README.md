# Pet Clinic Project

Hello, everyone! Welcome to the repository for the Pet Clinic project. This project demonstrates how to build and Dockerize a Spring Boot application. Below, you'll find instructions for running the application locally and using Docker, as well as integrating SonarQube for code quality checks.

![Screenshot from 2024-10-21 19-53-50](https://github.com/user-attachments/assets/277f6a4c-b65d-4d4a-8137-ca1f6cc07ee2)

# Project Overview

In this Project, we will cover the following topics:

**Running the Project Locally:** Get the Spring Boot application up and running on your local machine.

**Dockerizing the Application:** Write a Dockerfile using a multi-stage build for efficient Docker images.

**Running the Application in a Docker Container:** Build and run the Docker container, making the application accessible through a specified port.

**Integrating SonarQube for Code Analysis:** Set up SonarQube to analyze your codebase and perform quality checks.

# Prerequisites
Make sure you have the following installed on your machine:

**Java 17**

**Gradle**

**Docker**

**SonarQube (for code analysis)**

# Getting Started

**Cloning the Repository**

Clone the repository from my GitHub account:

git clone https://github.com/kamranali111/Pet-Clinic.git

cd Pet-Clinic

Running the Application Locally

To run the Spring Boot application on your local machine:

Navigate to the project directory:

cd ~/workspace/Pet-Clinic
Use the following command to build and run the project:

./gradlew bootrun

The application will start using Java 17 and run on port 8090 by default. Access it by navigating to http://localhost:8090 in your web browser.


# Dockerizing the Application
This project uses a multi-stage build to create a Docker image, reducing the final image size.

 Create a Dockerfile in the root of your project:

# Dockerfile

FROM gradle:7.6.0-jdk17 AS build

WORKDIR /app

COPY . .

RUN ./gradlew clean build -x test

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/build/libs/pet-clinic.jar app.jar

EXPOSE 8090

ENTRYPOINT ["java", "-jar", "app.jar"]


**Build the Docker image:**


docker build -t pet-clinic .
Run the Docker container:


docker run -p 8090:8090 pet-clinic
The application will now be accessible at http://localhost:8090.

Integrating SonarQube for Code Analysis
Ensure SonarQube is running locally or on a server.

Update build.gradle to include the SonarQube plugin:


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


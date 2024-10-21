# Pet Clinic Project

Hello, everyone! Welcome to the repository for the Pet Clinic project. This project demonstrates how to build and Dockerize a Spring Boot application. Below, you'll find instructions for running the application locally and using Docker, as well as integrating SonarQube for code quality checks.

![Screenshot from 2024-10-21 19-53-50](https://github.com/user-attachments/assets/2742e26f-096e-428b-9042-ba16f5bcf159)

---

## Project Overview

In this project, we will cover the following topics:

- **Running the Project Locally:** Get the Spring Boot application up and running on your local machine.
- **Dockerizing the Application:** Write a Dockerfile using a multi-stage build for efficient Docker images.
- **Running the Application in a Docker Container:** Build and run the Docker container, making the application accessible through a specified port.
- **Integrating SonarQube for Code Analysis:** Set up SonarQube to analyze your codebase and perform quality checks.

---

## Prerequisites

Make sure you have the following installed on your machine:

- **Java 17**
- **Gradle**
- **Docker**
- **SonarQube** (for code analysis)

---

## Getting Started

### Cloning the Repository

Clone the repository from my GitHub account:

```bash
git clone https://github.com/kamranali111/Pet-Clinic.git
cd Pet-Clinic
```

### Running the Application Locally

To run the Spring Boot application on your local machine:

1. Navigate to the project directory:

   ```bash
   cd ~/workspace/Pet-Clinic
   ```

2. Use the following command to build and run the project:

   ```bash
   ./gradlew bootrun
   ```

The application will start using Java 17 and run on port 8090 by default. Access it by navigating to [http://localhost:8090](http://localhost:8090) in your web browser.

---

## Dockerizing the Application

This project uses a multi-stage build to create a Docker image, reducing the final image size.

Create a `Dockerfile` in the root of your project:

```dockerfile
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
```

### Build the Docker Image:

```bash
docker build -t pet-clinic .
```

### Run the Docker Container:

```bash
docker run -p 8090:8090 pet-clinic
```

The application will now be accessible at [http://localhost:8090](http://localhost:8090).

---

## Integrating SonarQube for Code Analysis

Make sure SonarQube is running locally or on a server. You can run SonarQube using the following command:

```bash
docker run -d --name sonarqube -p 9000:9000 sonarqube
```

Follow the SonarQube setup instructions to analyze your codebase and perform quality checks.

---

## Contributing

Feel free to fork this repository, make changes, and submit a pull request. All contributions are welcome!

---

## License

This project is licensed under the MIT License.

---

## Connect with Me

[![YouTube](https://img.shields.io/badge/YouTube-Channel-red?logo=youtube&logoColor=white&style=for-the-badge)](https://www.youtube.com/@KamranAli-lx6cm)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-blue?logo=linkedin&logoColor=white&style=for-the-badge)](https://www.linkedin.com/in/kamran-ali-devops)
[![Website](https://img.shields.io/badge/Website-Visit-green?logo=google-chrome&logoColor=white&style=for-the-badge)](https://www.kamrandevops.com/)

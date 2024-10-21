
# 🐾 Pet Clinic Project

Welcome to the **Pet Clinic** project repository! This project demonstrates how to build and Dockerize a Spring Boot application. In addition, it showcases how to integrate **SonarQube** for code quality analysis.

![Screenshot from 2024-10-21 19-53-50](https://github.com/user-attachments/assets/8a66809b-b798-4a60-845d-d2db30835c02)

---

## 📚 Project Overview

This project covers the following topics:

- **Running the Project Locally**: Get the Spring Boot application up and running on your local machine.
- **Dockerizing the Application**: Create a Dockerfile using a multi-stage build for efficient Docker images.
- **Running the Application in a Docker Container**: Build and run the Docker container to make the application accessible through a specific port.
- **Integrating SonarQube for Code Analysis**: Set up SonarQube for analyzing the codebase and performing quality checks.

---

## 🔧 Prerequisites

Ensure you have the following tools installed on your machine before proceeding:

- **Java 17**
- **Gradle**
- **Docker**
- **SonarQube** (for code quality analysis)

---

## 🚀 Getting Started

### 1. Cloning the Repository

Clone the repository from GitHub:

```bash
git clone https://github.com/kamranali111/Pet-Clinic.git
cd Pet-Clinic
```

### 2. Running the Application Locally

To run the Spring Boot application on your local machine:

1. Navigate to the project directory:

   ```bash
   cd ~/workspace/Pet-Clinic
   ```

2. Use the following command to build and run the project:

   ```bash
   ./gradlew bootrun
   ```

The application will start using **Java 17** and run on port **8090** by default. You can access it by navigating to [http://localhost:8090](http://localhost:8090) in your web browser.

---

## 🐳 Dockerizing the Application

This project uses a **multi-stage build** to create a Docker image, reducing the final image size.

Create a `Dockerfile` in the root of your project with the following content:

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

### Build the Docker Image

```bash
docker build -t pet-clinic .
```

### Run the Docker Container

```bash
docker run -p 8090:8090 pet-clinic
```

The application will now be accessible at [http://localhost:8090](http://localhost:8090).

---

## 🧪 Integrating SonarQube for Code Analysis

Make sure SonarQube is running locally or on a server. You can run SonarQube using the following command:

```bash
docker run -d --name sonarqube -p 9000:9000 sonarqube
```

### SonarQube Configuration

Create a `sonar-project.properties` file in the root of your project with the following content:

```properties
sonar.projectKey=pet-clinic
sonar.projectName=Pet Clinic
sonar.host.url=http://localhost:9000/
sonar.token=squ_9623951b24c0a5d5cf62c59b8968fb150e6710ad
sonar.java.binaries=build/classes/java/main,build/classes/java/test
```

### Running SonarScanner

Make sure you have SonarScanner installed. Then, run the following command in your project directory to analyze your code:

```bash
sonar-scanner
```

Follow the SonarQube setup instructions to analyze your codebase and perform quality checks.

---

## 🤝 Contributing

Feel free to fork this repository, make changes, and submit a pull request. All contributions are welcome!

---

## 📞 Connect with Me

[![YouTube](https://img.shields.io/badge/YouTube-Channel-red?logo=youtube&logoColor=white&style=for-the-badge)](https://www.youtube.com/@KamranAli-lx6cm)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-blue?logo=linkedin&logoColor=white&style=for-the-badge)](https://www.linkedin.com/in/kamran-ali-devops)

[![Website](https://img.shields.io/badge/Website-Visit-green?logo=google-chrome&logoColor=white&style=for-the-badge)](https://www.kamrandevops.com/)

[![Facebook](https://img.shields.io/badge/Facebook-Profile-blue?logo=facebook&logoColor=white&style=for-the-badge)](https://web.facebook.com/p/kamran-100004855200872/)

📧 [kamranali.it111@gmail.com](mailto:kamranali.it111@gmail.com)


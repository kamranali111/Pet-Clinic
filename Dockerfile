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
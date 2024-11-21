
FROM maven:3.8.6-openjdk-17-slim AS builder
WORKDIR /build
COPY . .
RUN mvn clean package

# Stage 2: Run the application
FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=builder /build/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
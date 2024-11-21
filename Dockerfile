
FROM maven:3.8.6-eclipse-temurin-17-slim AS builder
WORKDIR /build
COPY . .
RUN mvn clean package

# Stage 2: Run the application
FROM maven:3.8-eclipse-temurin-17-slim
WORKDIR /app
COPY --from=builder /build/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
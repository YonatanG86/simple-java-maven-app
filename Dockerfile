# Stage 1: Build
FROM maven:3.8.5-openjdk-11 as builder
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Runtime
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
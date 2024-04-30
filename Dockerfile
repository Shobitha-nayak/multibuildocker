# Stage 1: Build the application
FROM openjdk:11 AS build
WORKDIR /app
COPY . .
RUN ./gradlew build  # Use your build tool command here (e.g., Maven or Gradle)

# Stage 2: Create the runtime image
FROM openjdk:11-jre-slim AS final
WORKDIR /app
COPY --from=build /app/build/libs/*.jar ./app.jar
CMD ["java", "-jar", "app.jar"]

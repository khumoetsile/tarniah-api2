FROM openjdk:17-jdk-slim

EXPOSE 8080

COPY --from=build /app/target/demo-0.0.1.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]


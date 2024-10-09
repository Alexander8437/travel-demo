FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/demoproject-0.0.1-SNAPSHOT.jar demoproject.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar","demoproject.jar"]
FROM eclipse-temurin:17.0.13_11-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY target/Banking-*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

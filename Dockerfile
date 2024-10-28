FROM eclipse-temurin:21.0.5_11-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY target/Banking-*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
FROM openjdk:8-jdk-alpine
COPY target/spring5webapp-0.0.1-SNAPSHOT.jar .
CMD /usr/bin/java -Xmx400m -Xms400m -jar spring5webapp-0.0.1-SNAPSHOT.jar
EXPOSE 8080

FROM gradle:7-jdk11 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
# Set environment variables for JVM memory settings
ENV _JAVA_OPTIONS="-Xms512m -Xmx1024m"
RUN gradle buildFatJar --no-daemon --info

FROM openjdk:11
EXPOSE 8080:8080
RUN mkdir /app
COPY --from=build /home/gradle/src/build/libs/*.jar /app/charge-finder-bff.jar
ENTRYPOINT ["java","-jar","/app/charge-finder-bff.jar"]
FROM openjdk:17-alpine
COPY ./*.jar /app/app.jar
RUN ["chmod","+x","-R","/app"]
RUN ["ls","-la","/app"]
ENTRYPOINT ["java","-jar","/app/app.jar"]

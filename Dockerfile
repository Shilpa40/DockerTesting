# Add base alpine image
FROM alpine:3.14

LABEL maintainer = "shilpabains40@gmail.com"

RUN apk add openjdk11

#create non root user with gid 1001
RUN addgroup -g 1001 -S appuser && adduser -u 1001 -S appuser -G appuser
RUN mkdir /logs && chown -R appuser:appuser /logs
RUN mkdir /app && chown -R appuser:appuser /app
USER appuser

COPY ./Shilpa.jar /app/Shilpa.jar
EXPOSE 8080 
WORKDIR /app
ENTRYPOINT ["java","-jar","Shilpa.jar"]

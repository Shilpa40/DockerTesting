# Base alpine image Version Argument
ARG BASE_IMG_VER

#Base Alpine image
FROM alpine:$BASE_IMG_VER

LABEL maintainer = "shilpabains40@gmail.com"

RUN apk add openjdk11

#create non root user with gid 1001
RUN addgroup -g 1001 -S appuser && adduser -u 1001 -S appuser -G appuser
RUN mkdir /logs && chown -R appuser:appuser /logs
RUN mkdir /app && chown -R appuser:appuser /app
USER appuser

COPY ./hello_world.jar /app/hello_world.jar
EXPOSE 8080 
WORKDIR /app
CMD ["java","-jar","hello_world.jar"]

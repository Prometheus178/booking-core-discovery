FROM openjdk:17-jdk-slim

ENV HOME /home
WORKDIR /home/app
RUN mkdir /home/jenkins

ARG JAR_FILE=booking-core-discovery-1.0.jar
ARG JAR_FILE_SOURCE=build/libs/${JAR_FILE}

COPY ${JAR_FILE_SOURCE}  ${JAR_FILE}

ENTRYPOINT ["java","-jar","booking-core-discovery-1.0.jar"]
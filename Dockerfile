FROM openjdk:17-jdk-alpine

WORKDIR /apps

COPY src/Main.java /apps

RUN javac Main.java

CMD ["java", "Main"]

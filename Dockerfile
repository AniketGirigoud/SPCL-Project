FROM openjdk:17-jdk-alpine

WORKDIR /apps/work

COPY src/Main.java /apps/work

RUN javac Main.java

CMD ["java", "Main"]

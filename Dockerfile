FROM docker pull openjdk
MAINTAINER Mohamed Fawzy

COPY target/spring-petclinic-1.5.1.jar /opt
EXPOSE 8080

CMD java - jar /opt/spring-petclinic-1.5.1.jar



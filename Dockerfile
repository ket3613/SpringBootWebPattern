FROM openjdk:13-jdk  

LABEL maintainer="jiys@tidesquare.com"

VOLUME /tmp 

EXPOSE 9000 

ARG JAR_FILE=target/0.0.1-SNAPSHOT.jar 

ADD ${JAR_FILE} batch.jar

# 실행 명령
ENTRYPOINT ["java","-Djava.security.egd", "-Xdebug","-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005","-jar","/batch.jar"]

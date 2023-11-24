FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.96/bin/apache-tomcat-8.5.96.tar.gz
RUN tar -zxvf apache-tomcat-8.5.96.tar.gz
WORKDIR /apache-tomcat-8.5.96
COPY Amazon.war webapps/
EXPOSE 8080
CMD ["bin/catalina.sh", "run"]


FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y wget
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.50/bin/apache-tomcat-9.0.50.tar.gz
RUN tar -zxvf apache-tomcat-9.0.50.tar.gz
WORKDIR /apache-tomcat-9.0.50
COPY Amazon.war webapps/
EXPOSE 8080
CMD ["bin/catalina.sh", "run"]


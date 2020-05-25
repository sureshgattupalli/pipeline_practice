FROM ubuntu

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.55/bin/apache-tomcat-8.5.55.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.55/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
COPY *.war .

EXPOSE 8088

CMD ["/opt/tomcat/bin/catalina.sh", "run"]

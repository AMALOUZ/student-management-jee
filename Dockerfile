FROM tomcat:9.0-jdk8

COPY target/student-management.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
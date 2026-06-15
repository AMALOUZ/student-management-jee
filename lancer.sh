#!/bin/bash
export JAVA_HOME=/c/Program\ Files/Java/jdk1.8.0_111
export CATALINA_HOME=/c/tomcat

echo "=== Compilation ==="
mvn clean package

echo "=== Déploiement ==="
cp target/student-management.war /c/tomcat/webapps/ROOT.war

echo "=== Démarrage Tomcat ==="
/c/tomcat/bin/startup.bat

echo "=== Terminé ! Va sur http://localhost:8080/ ==="

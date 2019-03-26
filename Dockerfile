FROM tomcat:8.0.51-jre8-alpine
COPY target/ /target
CMD java -jar /target/dependency/webapp-runner.jar /target/*.war

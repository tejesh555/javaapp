FROM maven:3.6.0-jdk-11-slim AS build
WORKDIR /app
COPY . /app
RUN mvn -f /app/pom.xml clean package

FROM tomcat:9.0
COPY --from=build /app/target/Spring3HibernateApp.war /usr/local/tomcat/webapps/
EXPOSE 8080


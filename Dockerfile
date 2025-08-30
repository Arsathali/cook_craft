# Stage 1: Build WAR with Maven
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
COPY WebContent ./WebContent
RUN mvn clean package -DskipTests

# Stage 2: Deploy WAR to Tomcat
FROM tomcat:9.0-jdk17
# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT
# Copy your WAR as ROOT.war so it runs at "/"
COPY --from=build /app/target/cookCraft-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]


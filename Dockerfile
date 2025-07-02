
# Use official Tomcat base image
FROM tomcat:9.0

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your built WAR file to ROOT
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

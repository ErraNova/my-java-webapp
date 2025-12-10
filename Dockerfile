FROM tomcat:11.0-jdk21-openjdk

RUN rm -rf /usr/local/tomcat/webapps/*
COPY site_web.war /usr/local/tomcat/webapps/ROOT.war

# Railway utilise PORT 8080, mais utilisons la variable d'environnement
ENV PORT=8080

# Cette commande CORRECTE remplace 8080 par ${PORT}
RUN sed -i 's/port="8080"/port="${PORT}"/' /usr/local/tomcat/conf/server.xml

EXPOSE 8080
CMD ["catalina.sh", "run"]

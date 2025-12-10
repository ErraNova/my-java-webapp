FROM tomcat:11.0-jdk21-openjdk

RUN rm -rf /usr/local/tomcat/webapps/*
COPY site_web.war /usr/local/tomcat/webapps/ROOT.war

# هذا السطر الجديد ضروري لـ Vercel
ENV PORT=8080
RUN sed -i "s/port=\"8080\"/port=\"${PORT}\"/" /usr/local/tomcat/conf/server.xml

EXPOSE 8080
CMD ["catalina.sh", "run"]

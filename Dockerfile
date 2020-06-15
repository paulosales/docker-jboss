FROM openjdk:7-alpine

LABEL maintainer="Paulo Rogério Sales Santos <paulosales@gmail.com>"

#Install Jboss and pwgen
RUN apk update && \
  apk add pwgen --no-cache && \
  wget -q http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz && \
  wget -q https://repo1.maven.org/maven2/org/jboss/modules/jboss-modules/1.1.5.GA/jboss-modules-1.1.5.GA.jar && \
  tar zxf jboss-as-7.1.1.Final.tar.gz && \
  mv jboss-modules-1.1.5.GA.jar jboss-as-7.1.1.Final/jboss-modules.jar && \
  rm jboss-as-7.1.1.Final.tar.gz && \
  rm -rf /var/cache/apk/*

RUN sed -i -r 's/jboss.bind.address.management:127.0.0.1/jboss.bind.address.management:0.0.0.0/' /jboss-as-7.1.1.Final/standalone/configuration/standalone.xml

ADD run.sh /run.sh

RUN chmod +x /*.sh

ENV JBOSS_PASS admin

EXPOSE 8080 9990
CMD ["/run.sh"]

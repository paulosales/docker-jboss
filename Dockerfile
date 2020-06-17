FROM openjdk:7-alpine

LABEL maintainer="Paulo Rogério Sales Santos <paulosales@gmail.com>"

#Install Jboss and pwgen
RUN apk update && \
  wget -q http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz && \
  wget -q https://repo1.maven.org/maven2/org/jboss/modules/jboss-modules/1.1.5.GA/jboss-modules-1.1.5.GA.jar && \
  tar zxf jboss-as-7.1.1.Final.tar.gz && \
  mv jboss-modules-1.1.5.GA.jar jboss-as-7.1.1.Final/jboss-modules.jar && \
  rm jboss-as-7.1.1.Final.tar.gz && \
  rm -rf /var/cache/apk/*

ADD run.sh /run.sh

ENV JBOSS_PASS adminpwd

RUN chmod +x /*.sh && \
  sed -i -r 's/jboss.bind.address.management:127.0.0.1/jboss.bind.address.management:0.0.0.0/' /jboss-as-7.1.1.Final/standalone/configuration/standalone.xml && \
  /jboss-as-7.1.1.Final/bin/add-user.sh --silent=true admin ${JBOSS_PASS}

EXPOSE 8080 9990

CMD ["/run.sh"]

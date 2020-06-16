# prsales/jboss

Docker image that runs JBoss over Openjdk.

## Image tags

* [`7`, `7-alpine`, `latest`](https://github.com/paulosales/docker-jboss/blob/master/Dockerfile) - Jboss 7 over Openjdk 7

## Usage

```bash
docker run -d -p 8080:8080 -p 9990:9990 prsales/jboss
```

## The default admin password

The default admin password is `admin`. You can specify a customized password using the environment variable `JBOSS_PASS` like that:

```bash
docker run -d -p 8080:8080 -p 9990:9990 -e JBOSS_PASS="mypass" prsales/jboss
```

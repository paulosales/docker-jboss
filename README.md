# prsales/jboss

Docker image that runs JBoss over Openjdk.

## Supported tags and respective `Dockerfile` links

* [`7`, `7-alpine`, `latest`](https://github.com/paulosales/docker-jboss/blob/master/Dockerfile) - JBoss 7.1.1 over Openjdk 7

## Usage

```bash
docker run -d -p 8080:8080 -p 9990:9990 prsales/jboss
```

## The default admin password

The default admin password is `admin`. You can specify a customized password using the environment variable `JBOSS_PASS` like that:

```bash
docker run -d -p 8080:8080 -p 9990:9990 -e JBOSS_PASS="mypass" prsales/jboss
```

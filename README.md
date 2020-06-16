# prsales/jboss

Docker image to run JBoss over openjdk.

## Image tags

```text
prsales/jboss:latest
prsales/prsales/jboss:7
prsales/openjdk-jboss:7-alpine
```

## Usage

```bash
docker run -d -p 8080:8080 -p 9990:9990 prsales/jboss
```

## The default admin password

The default admin password is `admin`. You can specify a customized password using the enviroment variable `JBOSS_PASS` like that:

```bash
docker run -d -p 8080:8080 -p 9990:9990 -e JBOSS_PASS="mypass" prsales/jboss
```

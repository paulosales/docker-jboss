CHANGED_FILES=

if [ "${TRAVIS_PULL_REQUEST}" = "false" ] ; then
  COMMIT_RANGE="$(echo ${TRAVIS_COMMIT_RANGE} | cut -d '.' -f 1,4 --output-delimiter '..')"
  CHANGED_FILES="$(git diff --name-only ${COMMIT_RANGE} --)"
else
  CHANGED_FILES="$(git diff --name-only ${TRAVIS_BRANCH}..HEAD --)"
fi

for FILE in ${CHANGED_FILES}; do
  if [ ${FILE} == "Dockerfile" ]; then
    docker system prune -af --volumes
    docker build -t prsales/jboss .
    echo ${DOCKER_PASSWORD} | docker login -u prsales --password-stdin
    docker tag  prsales/jboss prsales/jboss:latest
    docker run --rm prsales/jboss:latest cat hello.txt
    docker push prsales/jboss:latest
  fi
  if [ ${FILE} == "v7/Dockerfile" ]; then
    docker system prune -af --volumes
    docker build -t prsales/jboss ./v7
    echo ${DOCKER_PASSWORD} | docker login -u prsales --password-stdin
    docker tag  prsales/jboss prsales/jboss:7
    docker run --rm prsales/jboss:7 cat hello.txt
    docker push prsales/jboss:7
  fi
  if [ ${FILE} == "/v7/alpine/Dockerfile" ]; then
    docker system prune -af --volumes
    docker build -t prsales/jboss ./v7/alpine
    echo ${DOCKER_PASSWORD} | docker login -u prsales --password-stdin
    docker tag  prsales/jboss prsales/jboss:7-alpine
    docker run --rm prsales/jboss:7-alpine cat hello.txt
    docker push prsales/jboss:7-alpine
  fi
done

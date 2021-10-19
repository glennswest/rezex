export GIT_COMMIT=$(git rev-parse --short HEAD)
rm -r -f tmp
mkdir tmp
echo $GIT_COMMIT > commit.id
docker build --no-cache -t glennswest/rezex:$GIT_COMMIT .
docker tag glennswest/rezex:$GIT_COMMIT  docker.io/glennswest/rezex:$GIT_COMMIT
docker push docker.io/glennswest/rezex:$GIT_COMMIT


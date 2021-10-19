export GIT_COMMIT=$(git rev-parse --short HEAD)
rm -r -f tmp
mkdir tmp
echo $GIT_COMMIT > commit.id
docker build --no-cache -t glennswest/zombiestorm:$GIT_COMMIT .
docker tag glennswest/zombiestorm:$GIT_COMMIT  docker.io/glennswest/zombiestorm:$GIT_COMMIT
docker push docker.io/glennswest/zombiestorm:$GIT_COMMIT


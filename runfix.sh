oc delete project/rezex
sleep 30
oc new-project rezex
oc create -f appfix.yaml


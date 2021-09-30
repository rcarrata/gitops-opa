# GitOps Management of Gatekeeper / OPA examples

* Deploy Openshift GitOps
```
until oc apply -k bootstrap/; do sleep 2; done

oc patch subscriptions.operators.coreos.com/openshift-gitops-operator -n openshift-operators --type='merge' \
--patch '{ "spec": { "config": { "env": [ { "name": "DISABLE_DEX", "value": "false" } ] } } }'

oc patch argocd/openshift-gitops -n openshift-gitops --type='merge' \
--patch='{ "spec": { "dex": { "openShiftOAuth": true } } }'

oc patch cm/argocd-rbac-cm -n openshift-gitops --type=merge -p '{"data":{"policy.default":"role:admin"}}'
```

* Deploy Gateekeper Operator/OPA with GitOps:
```
oc apply -k opa-deploy/base/
```

* Deploy Gatekeeper / OPA examples though ArgoCD
```
oc apply -k opa-examples/config/overlays/default/
```

## Useful Links

* [Rego Blog](https://github.com/garethahealy/rego-blog)
* [Demo Opa Basic](https://github.com/open-policy-agent/gatekeeper/blob/master/demo/basic/demo.sh)
* [Demo Opa AgileBank](https://github.com/open-policy-agent/gatekeeper/tree/master/demo/agilebank)

## ConfTest

[ConfTest](https://github.com/open-policy-agent/conftest)

```
$ conftest test deployment.yaml
FAIL - deployment.yaml - main - Containers must provide app label for pod selectors
FAIL - deployment.yaml - main - Containers must provide release label for pod selectors
FAIL - deployment.yaml - main - Containers must not run as root

3 tests, 0 passed, 0 warnings, 3 failures, 0 exceptions
```

```
$ conftest test deployment-fixed.yaml

3 tests, 3 passed, 0 warnings, 0 failures, 0 exceptions
```

package main

deny[msg] {
  input.kind == "Deployment"
  not input.spec.selector.matchLabels.release

  msg := "Containers must provide release label for pod selectors"
}

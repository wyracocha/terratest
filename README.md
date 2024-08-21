[![Docker build & push](https://github.com/wyracocha/terratest/actions/workflows/pipeline.yml/badge.svg?branch=master&event=push)](https://github.com/wyracocha/terratest/actions/workflows/pipeline.yml)
# Golang Terraform
This repository supports terraform, opentofu and golang. Designed to work with terraform  1.9.4 and golang 1.23.0.
You can use this image to try  terratest. 
## How to
```
docker run --rm -v $PWD:/app -w /app devildeveloper/terratest go test -v
```
## ROADMAP
- install terratest library 
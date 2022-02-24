help: ## Shows this generated help info for Makefile targets
	@grep -E '^[a-zA-Z_-]+:.*?(## )?.*$$' $(MAKEFILE_LIST) | sort | awk '{ if ( $$0 ~ /^[a-zA-Z_-]+:.*?## ?.*$$/ ) { split($$0,resultArr,/:.*## /) ; printf "\033[36m%-30s\033[0m %s\n", resultArr[1], resultArr[2] } else if ( $$0 ~ /^[a-zA-Z_-]+:.*$$/ ) { split($$0,resultArr,/:.*?/);  printf "\033[36m%-30s\033[0m\n", resultArr[1] } } '
build: ## Builds docker image
	docker build --platform linux/amd64 -t docker_ruby_2.6.0_toolkit:1.0.0 ./

terminal: ## Opens a terminal for run ruby commands
	make build
	docker run --rm -v `pwd`/src:/src -it docker_ruby_2.6.0_toolkit:1.0.0 /bin/bash

version: ## Displays ruby version in the container
	make build
	docker run docker_ruby_2.6.0_toolkit:1.0.0

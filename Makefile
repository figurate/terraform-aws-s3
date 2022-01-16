SHELL:=/bin/bash
include .env

EXAMPLE=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

.PHONY: all clean validate test docs format example archive

all: validate test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) -chdir=modules/website init && $(TERRAFORM) -chdir=modules/website validate

test: validate
	$(CHECKOV) -d /work

	#$(TFSEC) /work

diagram:
	$(DIAGRAMS) diagram.py

docs: diagram
	$(TERRAFORM_DOCS) markdown ./ > ./README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/website > ./modules/website/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/website && \
		$(TERRAFORM) fmt -list=true ./examples/encrypted && \
		$(TERRAFORM) fmt -list=true ./examples/public && \
		$(TERRAFORM) fmt -list=true ./examples/terraform-state

example:
	$(TERRAFORM) init examples/$(EXAMPLE) && $(TERRAFORM) plan -state=$(AWS_ACCOUNT).tfstate -input=false examples/$(EXAMPLE)

archive:
	zip aws-s3-bucket.zip *.tf modules/website/*.tf *.png *.md

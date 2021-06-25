.PHONY: all fmt validate build
all: fmt validate build
fmt:
	packer fmt .
validate:
	packer validate .
build:
	packer build *.hcl
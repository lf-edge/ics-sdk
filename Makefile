# Run specific make target inside devcontainer, in case you don't want to
# install dependencies
container-%:
	docker build -f .devcontainer/Dockerfile -t isc-sdk-container .
	docker run --rm -v $(PWD):/src -w /src -u $$(id -u) isc-sdk-container make $* 

# Run lint on OpenAPI specification
spec-lint:
	vacuum lint -d ./eve/docs/api/patch-envelopes.yml

go-gen:
	oapi-codegen --config=./go/client.cfg.yaml ./eve/docs/api/patch-envelopes.yml

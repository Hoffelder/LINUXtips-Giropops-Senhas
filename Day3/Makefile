all: lint build scan

clean: clean-docker clean-image

build:
	docker image build . --tag $(shell basename $(CURDIR))

scan:
	trivy image -q --scanners vuln -o trivy-report.md $(shell basename $(CURDIR))

clean-docker:
	docker container stop $(shell basename $(CURDIR))
	docker container remove $(shell basename $(CURDIR))

clean-image:
	docker image remove $(shell basename $(CURDIR))

run: 
	docker run -d --name $(shell basename $(CURDIR)) -p 5000:5000 --network giropops-network -e REDIS_HOST="redis-giropops-senhas" $(shell basename $(CURDIR))

lint: 
	hadolint --ignore DL3007 Dockerfile

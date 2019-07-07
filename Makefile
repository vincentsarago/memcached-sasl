
SHELL = /bin/bash
TAG = latest
IMAGE := ${DOCKER_USERNAME}/memcached-sasl:${TAG}

build:
	docker build --tag memcached-sasl:${TAG} .

region=us-east-1
login:
	`aws ecr get-login --region ${region} --no-include-email | sed 's|https://||'`

push:
	aws ecr describe-repositories --region ${region} --repository-names memcached-sasl > /dev/null 2>&1 || \
		aws ecr create-repository --region ${region} --repository-name memcached-sasl > /dev/null
	docker build --tag memcached-sasl:${TAG} .
	docker tag memcached-sasl:${TAG} "${AWS_ACCOUNT_ID}.dkr.ecr.${region}.amazonaws.com/memcached-sasl:${TAG}"
	docker push "${AWS_ACCOUNT_ID}.dkr.ecr.${region}.amazonaws.com/memcached-sasl:${TAG}"

dpush:
	docker tag memcached-sasl:${TAG} ${IMAGE}
	docker push ${IMAGE}

clean:
	docker stop memcached-sasl
	docker rm memcached-sasl

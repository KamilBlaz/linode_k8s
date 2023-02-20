export PROJECT_NAME = linode-k8s_dev
export DOKCER_COMPOSE_PROJECT_NAME = ${PROJECT_NAME}-infrastracture


checking-project:
ifndef PROJECT_NAME
	$(error PROJECT_NAME is required)
endif

checking-env:
ifndef ENVIRONMENT
	$(error ENVIRONMENT is required)
endif

make build:
	docker-compose build

init: checking-env
	docker-compose run --rm infra sh -c " \
		rm -rf .terraform && \
		terraform init -backend-config=backend.auto.tfvars \
	"

state-init: checking-env
	docker-compose run --rm -w /infra/env/${ENVIRONMENT}/state infra sh -c " \
		rm -rf .terraform && \
		terraform init \
	"

state-apply: checking-env
	docker-compose run --rm -w /infra/env/${ENVIRONMENT}/state infra \
		terraform apply -var-file=../main.auto.tfvars -var-file=../backend.auto.tfvars -var-file=../linode_secret.auto.tfvars

state-destroy: checking-env
	docker-compose run --rm -w /infra/env/${ENVIRONMENT}/state infra \
		terraform destroy -var-file=../main.auto.tfvars -var-file=../backend.auto.tfvars -var-file=../linode_secret.auto.tfvars

state-init-upgrade: checking-env
	docker-compose run --rm -w /infra/env/${ENVIRONMENT}/state infra sh -c " \
		rm -rf .terraform && \
		terraform init -upgrade \
	"
state-pull-bucket-state: checking-project checking-env
	docker-compose run --rm -w /infra/env/${ENVIRONMENT}/state infra sh -c "terraform state pull > state-bucket.json"

pull-secrets-vars: state-pull-state
	@docker-compose run --rm -w /infra/env/${ENVIRONMENT}/state infra sh -c "echo ACCESS_KEY_ID: && \
 		cat state.json | jq -r '.resources[]  | .instances[0].attributes.access_key ' && \
 		echo AWS_SECRET_ACCESS_KEY: && \
 		cat state.json | jq -r  '.resources[]   | .instances[0].attributes.secret_key'"


kubeconfig_export: checking-env
	@docker-compose run --rm -w /infra/env/${ENVIRONMENT} infra sh -c " \
    terraform state pull > state-main.json	&& \
	terraform output kubeconfig | jq -r '@base64d' > ~/.kube/lke-${ENVIRONMENT}.yaml"

plan: checking-env
	docker-compose run --rm infra terraform plan

apply: checking-env
	docker-compose run --rm infra terraform apply

destroy: state-init init
	docker-compose run --rm infra terraform destroy

pull-state: checking-project checking-env
	docker-compose run --rm infra sh -c "terraform state pull > state.json"

fmt:
	docker-compose run --rm -w /infra infra terraform fmt -diff -recursive

validate: checking-env
	docker-compose run --rm -w /infra/env/${ENVIRONMENT} infra terraform validate


shell: checking-project checking-env
	docker-compose run --rm infra sh


# Linode_k8s
Simple creating cluster in Linode Cloud via terraform

Prereq:
- Account on linode

Workflow to deploy linode-cluster with state and dev env

Create Access/Secret  Key 
Fill
File -> ~/.aws/credentials

[linode-s3]
aws_access_key_id=
aws_secret_access_key=

File -> ~/.aws/config

[profile linode-s3]
output = text
region = eu-central-1

export AWS_PROFILE=linode-s3

1. state-init
2. state-apply
3. export AWS_SECRET_ACCESS_KEY=""
   export AWS_ACCESS_KEY_ID="" 
4. init
5. plan
6. apply


ENVIRONMENT=dev make kubeconfig_export
export KUBECONFIG=$HOME/.kube/lke-${ENVIRONMENT}.yaml"


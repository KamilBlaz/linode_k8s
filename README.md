

# Project Name

A brief description of your project goes here.

## Table of Contents

- [About](#about)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## About

Simple creating cluster in Linode Cloud via terraform 🏗️ ☁☁

## Getting Started

These instructions will help you get a copy of the project up and running on your local machine.

### Prerequisites

- Account on Linode Cloud https://www.linode.com/
- Docker installed https://www.docker.com/

### Installation

1. Configuration credentials to linode

 File: ~/.aws/credentials

```
   [linode-s3]
   aws_access_key_id=
   aws_secret_access_key=
```

File: ~/.aws/config

 ```
   [profile linode-s3]
   output = text
   region = eu-central-1
```
2.  ``` export AWS_PROFILE=linode-s3 ```

   
## Usage

1. ``` make state-init  ``` 
2. ``` make state-apply  ```
4. ``` make init  ```
5. ``` make plan ```
6. ``` make apply  ```

7. Generating kubeconfing
```
ENVIRONMENT=dev make kubeconfig_export
export KUBECONFIG=$HOME/.kube/lke-${ENVIRONMENT}.yaml"
```
8. Ultimately you can use kubectl

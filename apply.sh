#!/bin/bash 

#make sure ${AWS_SECRET_ACCESS_KEY} is set
for ARGUMENT in "$@"
do

    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)

    case "$KEY" in
            client)          client=${VALUE} ;; #client1, client2
            environment)     environment=${VALUE} ;; #prod, staging, dev
            action)          action=${VALUE} ;; #init, apply, destroy
            *)
    esac

done

mkdir -p .terraform/${client}_${environment}

export TF_DATA_DIR=.terraform/${client}_${environment}

VARS="params/${client}_${environment}.params.tfvars"

pushd `dirname $0`/infra

source ../aws_acounts/${client}_${environment}.sh

terraform ${action}  -backend-config "../backends/${client}_${environment}.backend.tfvars"

popd


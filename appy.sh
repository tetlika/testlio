set -e
for ARGUMENT in "$@"
do

    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)

    case "$KEY" in
            action)         action=${VALUE} ;;
            *)
    esac

done

source statevars.sh
terraform ${action}  -var-file=../terraform.tfvars
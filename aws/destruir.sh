RANCHER_INSTANCE_ID=$(aws ec2 describe-instances --query "Reservations[].Instances[].InstanceId" --output text --filters 'Name=tag:Name,Values=*rancher-server')
echo "RANCHER_INSTANCE_ID = $RANCHER_INSTANCE_ID. Finalizando o Rancher server..."
echo ""
aws ec2 terminate-instances --instance-ids $RANCHER_INSTANCE_ID
echo ""
echo "Finalizando o restante do projeto"
echo ""
terraform init && terraform destroy -auto-approve

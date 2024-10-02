#RANCHER_INSTANCE_ID=$(aws ec2 describe-instances --query "Reservations[].Instances[].InstanceId" --output text --filters 'Name=tag:Name,Values=*rancher-server')
#echo "RANCHER_INSTANCE_ID = $RANCHER_INSTANCE_ID. Finalizando o Rancher server..."
#echo ""
#aws ec2 terminate-instances --instance-ids $RANCHER_INSTANCE_ID
#echo ""

RANCHER_VPC_ID=$(aws ec2 describe-vpcs --query "Vpcs[].VpcId" --output text --filters 'Name=tag:Name,Values=*rancher-vpc')
echo "RANCHER_INSTANCE_ID = $RANCHER_VPC_ID. Finalizando o Rancher server..."
echo ""
delete_vpc.sh --region us-east-1 --vpc-id $RANCHER_VPC_ID
echo ""

echo "Finalizando o restante do projeto"
echo ""
terraform init && terraform destroy -auto-approve

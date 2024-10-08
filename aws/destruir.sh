#RANCHER_INSTANCE_ID=$(aws ec2 describe-instances --query "Reservations[].Instances[].InstanceId" --output text --filters 'Name=tag:Name,Values=*rancher-server')
#echo "RANCHER_INSTANCE_ID = $RANCHER_INSTANCE_ID. Finalizando o Rancher server..."
#echo ""
#aws ec2 terminate-instances --instance-ids $RANCHER_INSTANCE_ID
#echo ""

RANCHER_VPC_ID=$(aws ec2 describe-vpcs --query "Vpcs[].VpcId" --output text --filters 'Name=tag:Name,Values=*rancher-vpc')
echo "RANCHER_VPC_ID = $RANCHER_VPC_ID. Finalizando o Rancher server..."
echo ""
chmod +x delete_vpc.sh
./delete_vpc.sh --region us-east-1 --vpc-id $RANCHER_VPC_ID --non-interactive 
# https://github.com/lianghong/delete_vpc/blob/master/delete_vpc.sh
echo ""
echo ""
echo "Finalizando o restante do projeto"
echo ""
#terraform destroy -auto-approve
rm -rf .terraform
rm -rf id_rsa id_rsa.pub kube_config_server.yaml kube_config_workload.yaml terraform.tfstate
echo "FIM"

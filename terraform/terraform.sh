#!/bin/bash

# Atualizar versao do Terraform: 
printf "\n\n xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx \n"
printf "\n\n\tTerraform:\n\n"

# Install Ubuntu / Debian (https://developer.hashicorp.com/terraform/install)
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpgecho "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.listsudo apt update && sudo apt install terraform

#curl -s "https://releases.hashicorp.com/terraform/1.8.1/terraform_1.8.1_linux_amd64.zip" -o "terraform_linux_amd64.zip"
#unzip terraform_linux_amd64.zip
#sudo mv terraform /usr/bin/

# Verificando as versões instaladas e atualizar permissão docker:
cd ~
printf "\n\n xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx \n"
printf "\n\n\tVerificando as instações:\n\n"

printf "\n\tTERRAFORM:\n"
terraform --version

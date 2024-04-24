output "aws_rancher_url" {
  value = module.rancher_common.rancher_url
}

output "aws_rancher_usuario_login" {
  value = "admin"
}

output "aws_rancher_usuario_senha" {
  value = "fiapadmin123"
}

output "cluster_criado" {
  value = "--------- OK --------- "
}

output "fiap_master_ip" {
  value = aws_instance.fiap_master.public_ip
}

output "fiap_worker1_ip" {
  value = aws_instance.fiap_worker1.public_ip
}

output "fiap_worker2_ip" {
  value = aws_instance.fiap_worker2.public_ip
}

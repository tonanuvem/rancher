output "rancher_server_url" {
  value = module.rancher_common.rancher_url
}

output "usuario_login {
  value = "admin"
}

output "senha_login" {
  value = "fiapadmin123"
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

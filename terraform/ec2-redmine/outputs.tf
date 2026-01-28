# ============================================================================
# OUTPUTS.TF - Saídas do Terraform
# ============================================================================
# Este arquivo define as informações que serão exibidas após a execução
# do Terraform. Os outputs facilitam a obtenção de dados importantes
# como IP da instância, ID, etc.
#
# Documentação: https://www.terraform.io/language/values/outputs
# ============================================================================

# ============================================================================
# OUTPUT: IP PÚBLICO DA INSTÂNCIA
# ============================================================================
# Exibe o IP público atribuído à instância EC2.
# Este IP é necessário para:
# - Acessar a instância via SSH
# - Atualizar o registro DNS
# - Testar o redmine via navegador
# ============================================================================

output "instance_public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.redmine_nginx.public_ip
}

# ============================================================================
# OUTPUT: ID DA INSTÂNCIA
# ============================================================================
# Exibe o ID único da instância EC2 criada.
# Útil para referência e gerenciamento posterior.
# ============================================================================

output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.redmine_nginx.id
}

# ============================================================================
# OUTPUT: DNS PRIVADO DA INSTÂNCIA
# ============================================================================
# Exibe o DNS privado da instância (útil para comunicação interna na VPC).
# ============================================================================

output "instance_private_dns" {
  description = "DNS privado da instância"
  value       = aws_instance.redmine_nginx.private_dns
}

# ============================================================================
# OUTPUT: SECURITY GROUP ID
# ============================================================================
# Exibe o ID do Security Group criado.
# Útil para referência em futuras configurações.
# ============================================================================

output "security_group_id" {
  description = "ID do Security Group"
  value       = aws_security_group.redmine_nginx_sg.id
}

# ============================================================================
# OUTPUT: STATUS DA INSTÂNCIA
# ============================================================================
# Exibe o estado atual da instância (running, stopped, etc.).
# ============================================================================

output "instance_state" {
  description = "Estado da instância EC2"
  value       = aws_instance.redmine_nginx.instance_state
}

# ============================================================================
# OUTPUT: INFORMAÇÕES RESUMIDAS
# ============================================================================
# Exibe um resumo com as informações mais importantes para uso imediato.
# ============================================================================

output "resumo_instancia" {
  description = "Resumo das informações da instância"
  value = {
    ip_publico    = aws_instance.redmine_nginx.public_ip
    id_instancia  = aws_instance.redmine_nginx.id
    tipo          = aws_instance.redmine_nginx.instance_type
    estado        = aws_instance.redmine_nginx.instance_state
    chave_acesso  = var.key_name
    usuario_ssh   = "admin"
    comando_ssh   = "ssh -i ~/.ssh/${var.key_name}.pem ubuntu@${aws_instance.redmine_nginx.public_ip}"
  }
}

# ============================================================================
# OUTPUT: PRÓXIMOS PASSOS
# ============================================================================
# Exibe instruções para os próximos passos após a criação da instância.
# ============================================================================

output "proximos_passos" {
  description = "Instruções para os próximos passos"
  value = <<-EOT
    
    ✓ Instância criada com sucesso!
    
    PRÓXIMOS PASSOS:
    
    1. Atualizar DNS (Registro BR):
       - Domínio: site.esalabifmt.com.br
       - Apontar para: ${aws_instance.redmine_nginx.public_ip}
    
    2. Aguardar propagação DNS (pode levar alguns minutos)
    
    3. Conectar via SSH:
       ssh -i ~/.ssh/${var.key_name}.pem ubuntu@${aws_instance.redmine_nginx.public_ip}
    
    4. Após SSH conectado, executar os comandos de configuração manual
       (ou usar Ansible para automação)
    
    INFORMAÇÕES:
    - IP Público: ${aws_instance.redmine_nginx.public_ip}
    - ID Instância: ${aws_instance.redmine_nginx.id}
    - Estado: ${aws_instance.redmine_nginx.instance_state}
    - Chave: ${var.key_name}.pem
    
  EOT
}

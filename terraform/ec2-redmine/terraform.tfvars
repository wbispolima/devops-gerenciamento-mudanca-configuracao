# ============================================================================
# TERRAFORM.TFVARS - Valores das Variáveis
# ============================================================================
# Este arquivo contém os valores específicos para as variáveis declaradas
# em variables.tf. Aqui você customiza o comportamento do Terraform sem
# alterar o código-fonte principal.
#
# IMPORTANTE: Este arquivo pode conter informações sensíveis. Em produção,
# considere usar variáveis de ambiente ou ferramentas como Terraform Cloud.
#
# Documentação: https://www.terraform.io/language/values/variables
# ============================================================================

# Configuração da região AWS
aws_region = "sa-east-1"

# Identificação do Projeto
projeto       = "especializa-devops"
gerenciamento = "terraform-iac"
ambiente      = "desenvolvimento"
recurso       = "redmine-nginx"

# Configuração da Instância EC2
instance_type = "t3.small" # Alterado para t3.small para melhor desempenho
ami_ubuntu    = "ami-04d88e4b4e0a5db46" # AMI do Ubuntu 24.04 LTS (sa-east-1)
key_name      = "ifmt-devops-iac" # Chave SSH previamente criada na AWS
root_volume_size = 24 # Tamanho do volume raiz em GB


# Configuração de Rede
enable_public_ip = true
ssh_port         = 22
http_port        = 80

# Tags Adicionais
tags_adicionais = {
  Recurso = "redmine-nginx"
}

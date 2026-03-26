# ============================================================================
# TERRAFORM.TFVARS - Valores das Variáveis para ECS (Fargate)
# ============================================================================

# Configuração AWS
aws_region = "sa-east-1"

# Identificação do Projeto
projeto       = "especializa-devops"
ambiente      = "desenvolvimento"
recurso       = "site-nginx-ecs"

# Configuração do ECS (Fargate)
container_image = "nginx:latest"
container_port  = 80
cpu_units       = 256
memory_units    = 512
desired_count   = 1 # Mantém 1 container rodando (Sem Auto Scaling)

# Configuração de Rede
http_port = 80

# Tags Adicionais
tags_adicionais = {
  Recurso       = "site-nginx-ecs",
  Gerenciamento = "terraform-iac"
}

# ============================================================================
# VARIABLES.TF - Declaração de Variáveis para ECS (Fargate)
# ============================================================================
# Este arquivo declara as variáveis utilizadas no projeto ECS.
# ============================================================================

# ============================================================================
# VARIÁVEIS DE CONFIGURAÇÃO AWS
# ============================================================================

variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
  default     = "sa-east-1"
}

# ============================================================================
# VARIÁVEIS DE IDENTIFICAÇÃO DO PROJETO
# ============================================================================

variable "projeto" {
  description = "Nome do projeto para identificação nos recursos"
  type        = string
  default     = "especializa-devops"
}

variable "ambiente" {
  description = "Ambiente de implantação"
  type        = string
  default     = "desenvolvimento"
}

variable "recurso" {
  description = "Identificação do recurso específíco"
  type        = string
  default     = "site-nginx-ecs"
}

# ============================================================================
# VARIÁVEIS DE CONFIGURAÇÃO DO ECS (Fargate)
# ============================================================================

variable "container_image" {
  description = "Imagem Docker para o container (ex: nginx:latest)"
  type        = string
  default     = "nginx:latest"
}

variable "container_port" {
  description = "Porta que o container está escutando"
  type        = number
  default     = 80
}

variable "cpu_units" {
  description = "Unidades de CPU (1024 = 1 vCPU)"
  type        = number
  default     = 256
}

variable "memory_units" {
  description = "Unidades de Memória (em MiB)"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Quantidade desejada de tasks (instâncias do container)"
  type        = number
  default     = 1
}

# ============================================================================
# VARIÁVEIS DE REDE E TAGS
# ============================================================================

variable "http_port" {
  description = "Porta HTTP externa"
  type        = number
  default     = 80
}

variable "tags_adicionais" {
  description = "Tags adicionais para os recursos"
  type        = map(string)
  default     = {
    Recurso = "site-nginx-ecs"
    ManagedBy = "Terraform"
  }
}

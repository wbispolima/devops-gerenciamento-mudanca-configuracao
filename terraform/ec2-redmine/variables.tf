# ============================================================================
# VARIABLES.TF - Declaração de Variáveis
# ============================================================================
# Este arquivo declara todas as variáveis utilizadas no projeto Terraform.
# As variáveis permitem que o código seja reutilizável e flexível, sem
# necessidade de alterar o código-fonte para mudar valores de configuração.
#
# Documentação: https://www.terraform.io/language/values/variables
# ============================================================================

# ============================================================================
# VARIÁVEIS DE CONFIGURAÇÃO AWS
# ============================================================================

variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
  # default     = "sa-east-1"
}

# ============================================================================
# VARIÁVEIS DE IDENTIFICAÇÃO DO PROJETO
# ============================================================================

variable "projeto" {
  description = "Nome do projeto para identificação nos recursos"
  type        = string
  # default     = "especializa-devops"
}

variable "gerenciamento" {
  description = "Tipo de gerenciamento do recurso (IaC ou manual)"
  type        = string
  # default     = "terraform-iac"
}

variable "ambiente" {
  description = "Ambiente de implantação"
  type        = string
  # default     = "desenvolvimento"
}

variable "recurso" {
  description = "Identificação do recurso específíco"
  type        = string
  # default     = "redmine-nginx"
}

# ============================================================================
# VARIÁVEIS DE CONFIGURAÇÃO DA INSTÂNCIA EC2
# ============================================================================

variable "instance_type" {
  description = "Tipo de instância EC2"
  type        = string
  # default     = "t3.micro"
}

variable "ami_ubuntu" {
  description = "AMI do Ubuntu 22.04 LTS (sa-east-1)"
  type        = string
  # default     = "ami-04d88e4b4e0a5db46"
}

variable "key_name" {
  description = "Nome da chave PEM para acesso SSH"
  type        = string
  # default     = "ifmt-devops-iac"
}

variable "root_volume_size" {
  description = "Tamanho do volume raiz em GB"
  type        = number
  # default     = 24
}


# ============================================================================
# VARIÁVEIS DE CONFIGURAÇÃO DE REDE
# ============================================================================

variable "enable_public_ip" {
  description = "Habilitar IP público na instância"
  type        = bool
  # default     = true
}

variable "ssh_port" {
  description = "Porta SSH"
  type        = number
  # default     = 22
}

variable "http_port" {
  description = "Porta HTTP"
  type        = number
  # default     = 80
}

# ============================================================================
# VARIÁVEIS DE TAGS
# ============================================================================

variable "tags_adicionais" {
  description = "Tags adicionais para os recursos"
  type        = map(string)
  # default = {
  #   Recurso = "redmine-nginx"
  # }
}

# ============================================================================
# VERSIONS.TF - Configuração de Versões para ECS
# ============================================================================

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Projeto       = var.projeto
      Ambiente      = var.ambiente
      Gerenciamento = "terraform-iac"
      Exemplo       = "ecs-fargate"
    }
  }
}

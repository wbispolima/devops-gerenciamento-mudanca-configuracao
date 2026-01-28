# ============================================================================
# MAIN.TF - Configuração Principal da Infraestrutura
# ============================================================================
# Este arquivo contém a definição dos recursos principais:
# - Security Group: Controla o acesso à instância (portas 22 e 80)
# - Instância EC2: Máquina virtual Ubuntu 22.04 LTS
#
# Documentação:
# - Security Group: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
# - EC2 Instance: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
# ============================================================================

# ============================================================================
# SECURITY GROUP
# ============================================================================
# Define as regras de firewall para a instância EC2.
# Permite acesso SSH (porta 22) e HTTP (porta 80) de qualquer origem.
#
# IMPORTANTE: Em produção, restrinja as origens de acesso (CIDR blocks).
# ============================================================================

resource "aws_security_group" "redmine_nginx_sg" {
  name_prefix = "redmine-nginx-"
  description = "Security Group para redmine-nginx - Especializacao DevOps"

  # Regra de entrada: SSH (porta 22)
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  # Regra de entrada: HTTP (porta 80)
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access"
  }


  # Regra de saída: Permitir todo o tráfego de saída
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "redmine-nginx-sg"
  }
}

# ============================================================================
# INSTÂNCIA EC2
# ============================================================================
# Cria uma instância EC2 com Ubuntu 22.04 LTS.
# A instância será acessível via SSH e HTTP.
#
# Recursos:
# - AMI: Ubuntu 22.04 LTS (sa-east-1)
# - Tipo: t2.micro (elegível para free tier)
# - Chave: ifmt-devops-iac.pem
# ============================================================================

resource "aws_instance" "redmine_nginx" {
  # Configuração básica
  ami           = var.ami_ubuntu
  instance_type = var.instance_type
  key_name      = var.key_name

  # Associar Security Group
  vpc_security_group_ids = [aws_security_group.redmine_nginx_sg.id]

  # Habilitar IP público
  associate_public_ip_address = var.enable_public_ip

  # Metadados da instância
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  # Configuração do volume raiz
  root_block_device {
  volume_size           = var.root_volume_size
  volume_type           = "gp3"
  delete_on_termination = true
}


  # Monitoramento detalhado
  monitoring = true

  # Tags para identificação
  tags = merge(
    {
      Name = "redmine-nginx-${var.ambiente}"
    },
    var.tags_adicionais
  )

  # Provisioner para aguardar SSH estar disponível
  provisioner "remote-exec" {
    inline = ["echo 'Instância pronta para uso'"]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("../../${var.key_name}.pem")
      host        = self.public_ip
      timeout     = "2m"
    }
  }

  # Mensagem de criação
  lifecycle {
    create_before_destroy = true
  }
}

# ============================================================================
# DATA SOURCE: VPC PADRÃO
# ============================================================================
# Referencia a VPC padrão da AWS (caso necessário para futuras extensões)
# ============================================================================

data "aws_vpc" "default" {
  default = true
}

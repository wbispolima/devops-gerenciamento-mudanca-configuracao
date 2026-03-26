# ============================================================================
# MAIN.TF - Infraestrutura ECS (Fargate) Minimalista
# ============================================================================

# ============================================================================
# CLUSTER ECS
# ============================================================================
resource "aws_ecs_cluster" "main" {
  name = "${var.projeto}-cluster"
  tags = var.tags_adicionais
}

# ============================================================================
# IAM ROLE - EXECUÇÃO DA TASK (Mínima)
# ============================================================================
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.projeto}-ecs-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

# Permissão mínima para baixar imagens do Docker Hub/ECR
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# ============================================================================
# TASK DEFINITION
# ============================================================================
resource "aws_ecs_task_definition" "app" {
  family                   = "${var.projeto}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu_units
  memory                   = var.memory_units
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([{
    name      = "site-nginx"
    image     = var.container_image
    essential = true
    portMappings = [{
      containerPort = var.container_port
      hostPort      = var.container_port
    }]
    # Logs removidos para simplicidade
  }])

  tags = var.tags_adicionais
}

# ============================================================================
# SECURITY GROUP (Acesso Direto ao Container)
# ============================================================================
resource "aws_security_group" "ecs_sg" {
  name        = "${var.projeto}-ecs-sg"
  description = "Permitir acesso HTTP direto ao container ECS"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = var.container_port
    to_port     = var.container_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Acesso público direto
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags_adicionais
}

# ============================================================================
# ECS SERVICE (Sem ALB e Sem Auto Scaling)
# ============================================================================
resource "aws_ecs_service" "main" {
  name            = "${var.projeto}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_sg.id]
    subnets          = data.aws_subnets.default.ids
    assign_public_ip = true # Essencial para acesso sem ALB
  }

  tags = var.tags_adicionais
}

# ============================================================================
# DATA SOURCES
# ============================================================================
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

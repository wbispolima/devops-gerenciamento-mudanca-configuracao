# ============================================================================
# OUTPUTS.TF - Saídas do Terraform para ECS Minimalista
# ============================================================================

output "ecs_cluster_name" {
  description = "Nome do Cluster ECS"
  value       = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  description = "Nome do Serviço ECS"
  value       = aws_ecs_service.main.name
}

output "proximos_passos" {
  description = "Instruções para acessar o site"
  value = <<-EOT
    
    ✓ Infraestrutura ECS Fargate (Minimalista) criada!
    
    COMO ACESSAR:
    Como não estamos usando um Load Balancer, o container recebe um IP público dinâmico.
    
    1. Vá ao Console AWS > ECS > Clusters > ${aws_ecs_cluster.main.name}
    2. Clique na aba "Tasks" e abra a Task que está rodando.
    3. Copie o "Public IP" e cole no seu navegador.
    
    DICA: Você também pode usar o comando abaixo para encontrar o IP:
    aws ecs list-tasks --cluster ${aws_ecs_cluster.main.name}
    
    INFORMAÇÕES:
    - Cluster: ${aws_ecs_cluster.main.name}
    - Serviço: ${aws_ecs_service.main.name}
    - Launch Type: FARGATE
    
  EOT
}

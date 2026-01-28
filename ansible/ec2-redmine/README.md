# Instalação Automatizada do Redmine 5.1 com Ansible

## 📋 Visão Geral

Este projeto automatiza a instalação e configuração completa do **Redmine 5.1** em uma instância EC2 com **Ubuntu 24.04**, utilizando **Ansible** com o padrão **Task-Based Architecture**.

**Tempo de execução:** 15-20 minutos

---

## 🏗️ Padrão de Organização: Task-Based Architecture

### O que é?

Task-Based Architecture é um padrão de organização de playbooks Ansible onde:

- Cada arquivo YAML representa uma **etapa lógica** da instalação
- Os arquivos são **numerados** (01, 02, 03...) para indicar a **sequência de execução**
- Cada arquivo é **autocontido**: contém todas as dependências necessárias
- O arquivo principal (`00-main.yml`) **orquestra** a execução dos demais

### Por que usar?

✅ **Clareza pedagógica**: Alunos veem exatamente a sequência de passos  
✅ **Facilidade de compreensão**: Numeração deixa claro o fluxo  
✅ **Modularidade**: Cada etapa pode ser executada independentemente  
✅ **Manutenção**: Fácil identificar e corrigir problemas em etapas específicas  
✅ **Documentação**: Cada arquivo documenta seu próprio propósito  

### Comparação com Role-Based Architecture

| Aspecto | Task-Based | Role-Based |
|---------|-----------|-----------|
| Estrutura | Arquivos numerados | Diretórios (roles/) |
| Clareza de fluxo | Excelente | Boa |
| Reutilização | Limitada | Excelente |
| Curva de aprendizado | Menor | Maior |
| Ideal para | Instalações lineares | Projetos complexos |

---

## 📁 Estrutura de Arquivos

```
ec2-redmine/
├── 00-main.yml                      # Playbook principal (orquestrador)
├── 01-update.yml                    # Atualizar SO
├── 02-allbasic.yml                  # Instalar utilitários básicos
├── 03-createuser.yml                # Criar usuários do sistema
├── 04-nginx.yml                     # Instalar Nginx
├── 05-mysql.yml                     # Instalar e configurar MySQL
├── 06-redmine-install.yml           # Instalar Redmine
├── 07-redmine-configure.yml         # Configurar Redmine
├── 08-redmine-configure-gninx.yml   # Configurar Nginx para Redmine
├── hosts.ini                        # Inventário Ansible
├── ansible.cfg                      # Configuração Ansible
└── README.md                        # Este arquivo
```

---

## 🚀 Como Usar

### Pré-requisitos

1. **Instância EC2 com Ubuntu 24.04**
   - AMI: `ami-0ebb9671e69bae1c7` (sa-east-1)
   - Usuário padrão: `admin`
   - Acesso SSH com chave privada

2. **Ansible instalado** (versão 2.9+)
   ```bash
   sudo apt install ansible
   ```

3. **Chave SSH** para acesso à instância

### Passo 1: Preparar o Ambiente

```bash
# 1. Extrair arquivo
tar -xzf ec2-redmine.tar.gz
cd ec2-redmine

# 2. Editar hosts.ini com dados reais
nano hosts.ini

# Substituir:
# - ansible_host: IP da instância
# - ansible_user: admin (para Ubuntu 24.04)
# - ansible_ssh_private_key_file: caminho da chave SSH
```

**Exemplo de hosts.ini configurado:**

```ini
[servervalidade]
redmine ansible_host=54.233.123.98 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/ifmt-devops-iac.pem
```

### Passo 2: Executar o Playbook

```bash
# Executar todo o playbook
ansible-playbook -i hosts.ini 00-main.yml

# Ou executar apenas uma etapa específica
ansible-playbook -i hosts.ini 00-main.yml --tags "redmine"
```

### Passo 3: Acessar o Redmine

Após a conclusão (15-20 minutos):

```
URL: http://IP
Usuário: admin
Senha: admin
```

---

## 📝 Descrição das Etapas

### 01-update.yml
Atualiza o sistema operacional Debian 12 para a versão mais recente.

### 02-allbasic.yml
Instala utilitários essenciais (curl, wget, vim, git, htop, etc.) e reinicia o servidor.

### 03-createuser.yml
Cria usuários padrão do sistema para acesso e recuperação.

### 04-nginx.yml
Instala o Nginx e remove a configuração padrão.

### 05-mysql.yml
Instala MySQL 8.0, configura segurança e hardening.

**Credenciais MySQL:**
- Usuário root: `root` / `Senha_12_F4c1l`

### 06-redmine-install.yml
Baixa e instala Redmine 5.1.2 com todas as dependências.

### 07-redmine-configure.yml
Configura banco de dados, instala gems e migra dados.

**Credenciais Redmine:**
- Usuário: `redmine` / `Senha_12`
- Banco de dados: `redmine`

### 08-redmine-configure-gninx.yml
Configura Nginx como servidor web para Redmine usando Passenger.

---

## ⚠️ Alertas e Warnings

### Warning: column_case_sensitive

```
[WARNING]: Option column_case_sensitive is not provided. The default is now false...
```

**Significado:** A versão futura do `community.mysql` mudará o comportamento padrão.

**Ação:** Não é necessário fazer nada. O script continua funcionando normalmente.

**Para fins educacionais:** Mostra aos alunos como lidar com deprecações.

---

## 🔐 Segurança

⚠️ **IMPORTANTE:** As senhas estão hardcoded nos scripts. Para produção:

1. Use **Ansible Vault** para senhas
2. Altere as senhas após instalação
3. Configure **SSL/TLS** com certificado válido
4. Restrinja acesso SSH apenas a IPs conhecidos

---

## 🛠️ Troubleshooting

### Erro: "Failed to connect"
- Verifique IP em `hosts.ini`
- Verifique caminho da chave SSH
- Verifique permissões da chave: `chmod 600 ~/.ssh/chave.pem`

### Erro: "Permission denied"
- Verifique que o usuário é `admin` (não `ubuntu`)
- Verifique que a chave SSH é a correta

### Erro: "Timeout"
- Verifique conexão de internet
- Verifique se Security Group permite SSH (porta 22)

---

## 📚 Referências

- [Documentação Oficial Ansible](https://docs.ansible.com/)
- [Documentação Redmine](https://www.redmine.org/projects/redmine/wiki/Guide)
- [Debian 12 (Bookworm)](https://www.debian.org/releases/bookworm/)

---

## 👨‍🎓 Para Fins Educacionais

Este projeto demonstra um conceito fundamental do **Infrastructure as Code (IaC)**:

> **"Você não precisa ter conhecimento tácito de cada uma das tarefas que estão sendo feitas, de todos os ajustes necessários para que rode o Redmine. Mas você consegue construir um servidor Redmine."**

Isso é o poder da automação: **codificar o conhecimento** e **reutilizá-lo** sem necessidade de expertise em cada detalhe.

---

## 📄 Licença

Desenvolvido para fins educacionais - Especialização em Engenharia DevOps - IFMT

---

**Desenvolvido com auxílio da IA Manus**

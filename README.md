# Gerenciamento de Mudanças, Configuração e Infraestrutura

**Recursos Complementares da Disciplina**

---

## 📚 Sobre Este Repositório

Este repositório contém **recursos complementares** da disciplina **"Gerenciamento de Mudanças, Configuração e Infraestrutura"** da Especialização em Engenharia DevOps do Instituto Federal de Mato Grosso (IFMT).

### ⚠️ Importante

**Este repositório NÃO substitui o curso.** O conteúdo acadêmico completo (videoaulas, materiais teóricos, fóruns, questões e atividades avaliativas) está disponível no **ambiente virtual de aprendizagem do IFMT Online**.

**Este repositório fornece:**
- Site estático de exemplo (publicado e acessível online)
- Exemplos práticos de código (Terraform, Ansible)
- Código-fonte de projetos utilizados nas aulas
- Recursos para exploração prática além do curso

---

## 📋 Informações da Disciplina

| Informação | Detalhes |
|-----------|----------|
| **Instituição** | Instituto Federal de Mato Grosso (IFMT) |
| **Centro** | Centro de Referência em Educação a Distância (CREAD) |
| **Curso** | Especialização em Engenharia DevOps |
| **Disciplina** | Gerenciamento de Mudanças, Configuração e Infraestrutura |
| **Professor** | Waldinei Bispo de Lima |
| **Período** | 16 de fevereiro a 17 de abril de 2026 |
| **Carga Horária** | 60 horas (30h teórica + 30h prática) |
| **Modalidade** | Educação a Distância (EAD) |

---

## 🌐 Site Estático - Acesso Online

O site estático está **publicado e acessível online** através do GitHub Pages:

### 🔗 [Acesse o Site](https://wbispolima.github.io/devops-gerenciamento-mudanca-configuracao/site/)

> **Nota:** O link será ativado após a configuração do GitHub Pages.

Este site será utilizado como exemplo prático para:
- Publicação manual em bucket S3 da AWS
- Automação de publicação com Terraform
- Demonstração de Infrastructure as Code (IaC)

---

## 📂 Estrutura do Repositório

```
devops-gerenciamento-mudanca-configuracao/
├── site/                    # Site estático (publicado via GitHub Pages)
├── terraform/               # Exemplos de Infraestrutura como Código
├── ansible/                 # Exemplos de Gerenciamento de Configuração
├── README.md               # Este arquivo
├── LICENSE                 # Licença MIT
└── .gitignore             # Arquivo de exclusão do Git
```

### 📁 Pastas Principais

#### **`site/`**
Contém o código-fonte do site estático utilizado nos exemplos práticos. Este site está publicado online via GitHub Pages e será utilizado como base para:
- Publicação manual em um bucket S3 da AWS
- Automação de publicação através de Terraform
- Demonstrações de Infrastructure as Code

**Estrutura interna:**
```
site/
├── index.html          # Página principal
├── css/               # Arquivos de estilo
├── js/                # Arquivos JavaScript (se houver)
└── assets/            # Imagens e outros recursos
```

#### **`terraform/`**
Exemplos práticos de Infraestrutura como Código (IaC) utilizando Terraform. Inclui:
- Configuração de buckets S3 para hospedagem de sites
- Provisionamento de instâncias EC2
- Outros recursos de infraestrutura na AWS

Cada exemplo contém um arquivo `README.md` com instruções de execução.

#### **`ansible/`**
Exemplos práticos de Gerenciamento de Configuração utilizando Ansible. Será preenchido durante a Unidade 3 do curso com playbooks para configuração de servidores.

---

## 🎯 Como Usar Este Repositório

### Pré-requisitos

Para explorar e executar os exemplos práticos, você precisará de:

**Para o Site Estático:**
- Um navegador web (para acessar o site publicado)
- Um editor de texto (para modificar o código HTML/CSS)

**Para Terraform:**
- Terraform instalado ([terraform.io/downloads](https://www.terraform.io/downloads))
- Conta AWS com credenciais configuradas
- Conhecimento básico de linha de comando

**Para Ansible:**
- Ansible instalado ([ansible.com](https://www.ansible.com/))
- Servidores ou máquinas virtuais para configurar
- Conhecimento básico de linha de comando

### Clonando o Repositório

```bash
git clone git@github.com:wbispolima/devops-gerenciamento-mudanca-configuracao.git
cd devops-gerenciamento-mudanca-configuracao
```

### Testando o Site Localmente

Para testar o site antes de fazer alterações:

```bash
# Opção 1: Usando Python 3
cd site/
python3 -m http.server 8000
# Acesse: http://localhost:8000

# Opção 2: Usando Node.js (se tiver http-server instalado)
cd site/
npx http-server
```

### Explorando os Exemplos

Cada pasta contém um arquivo `README.md` com instruções específicas sobre como executar os exemplos:
- `terraform/README.md` - Instruções para exemplos de Terraform
- `ansible/README.md` - Instruções para exemplos de Ansible

---

## 📤 Publicando o Site com GitHub Pages

### Configuração Inicial (Uma Única Vez)

1. Acesse o repositório no GitHub
2. Clique em **"Settings"** (Configurações)
3. No menu lateral, clique em **"Pages"**
4. Em **"Source"** (Fonte), selecione:
   - **Branch:** `main`
   - **Folder:** `/` (raiz) ou `/site` (conforme sua preferência)
5. Clique em **"Save"**

### Após a Configuração

- O site ficará disponível em: `https://wbispolima.github.io/devops-gerenciamento-mudanca-configuracao/`
- As atualizações são automáticas: qualquer push para `main` atualiza o site
- Pode levar alguns minutos para as mudanças aparecerem

### Referenciando o Site

Você pode referenciar este site em:
- Materiais didáticos (PDFs, slides)
- Videoaulas e apresentações
- Fóruns e discussões
- Documentação técnica
- Outras inteligências artificiais e ferramentas

**Exemplo de referência:**
```
Acesse o site de exemplo em: https://wbispolima.github.io/devops-gerenciamento-mudanca-configuracao/
```

---

## 📖 Conteúdo do Curso

O curso está dividido em 4 unidades:

### **Unidade 1: Fundamentos Teóricos** ✅
Evolução histórica do gerenciamento de mudanças, frameworks tradicionais, DevOps e Infrastructure as Code.

### **Unidade 2: Infrastructure as Code com Terraform** 🔄
Conceitos de IaC, Terraform, provisionamento de infraestrutura. Os exemplos deste repositório acompanham esta unidade. O site estático será utilizado como base para demonstrações práticas.

### **Unidade 3: Gerenciamento de Configuração com Ansible** 📋
Ansible, configuração de servidores, automação de tarefas. Os exemplos serão adicionados ao repositório durante esta unidade.

### **Unidade 4: GitOps e CI/CD** 📋
GitOps, pipelines CI/CD, integração contínua e entrega contínua.

---

## 🔗 Recursos Adicionais

- **Site Estático do Curso:** [GitHub Pages](https://wbispolima.github.io/devops-gerenciamento-mudanca-configuracao/)
- **Repositório GitHub:** [devops-gerenciamento-mudanca-configuracao](https://github.com/wbispolima/devops-gerenciamento-mudanca-configuracao)
- **Documentação Oficial do Terraform:** [terraform.io/docs](https://www.terraform.io/docs)
- **Documentação Oficial do Ansible:** [docs.ansible.com](https://docs.ansible.com/)
- **AWS Documentation:** [docs.aws.amazon.com](https://docs.aws.amazon.com/)
- **GitHub Pages Documentation:** [pages.github.com](https://pages.github.com/)
- **Curso Completo:** Acesse o IFMT Online para conteúdo teórico, videoaulas, fóruns e avaliações

---

## 📝 Licença

Este projeto está licenciado sob a **MIT License**. Veja o arquivo `LICENSE` para mais detalhes.

---

## 👨‍🏫 Contato

**Professor:** Waldinei Bispo de Lima  
**Email:** waldinei.bispo@ifmt.edu.br  
**Instituição:** IFMT - Centro de Referência em Educação a Distância (CREAD)

---

## ⚡ Notas Importantes

1. **Este repositório é complementar** ao curso oferecido no IFMT Online. Não substitui o conteúdo acadêmico, videoaulas, fóruns ou atividades avaliativas.

2. **Código em evolução:** Os exemplos serão adicionados e atualizados conforme o curso progride. Acompanhe os commits para ver as mudanças.

3. **Site publicado:** O site estático está disponível online via GitHub Pages e pode ser referenciado em qualquer contexto (materiais didáticos, videoaulas, outras ferramentas, etc.).

4. **Comunidade:** Você é encorajado a explorar, modificar e aprender com os exemplos. Sinta-se livre para clonar, estudar e adaptar o código para seus próprios projetos.

5. **Suporte:** Para dúvidas sobre o curso, acesse o ambiente virtual do IFMT Online ou entre em contato com o professor.

---

**Desenvolvido com ❤️ para a Especialização em Engenharia DevOps do IFMT**

*Última atualização: 24 de dezembro de 2025*

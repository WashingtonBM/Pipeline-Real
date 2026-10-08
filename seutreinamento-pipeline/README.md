# Pipeline de Pagamentos em Tempo Real (Supabase & Integração)

Este repositório documenta a implementação de um pipeline de pagamentos end-to-end, estruturado em cinco camadas claras — desde a fundação do banco de dados relacional até a operação e entrega dos dados processados.

## 🏗️ Arquitetura das Cinco Camadas

### Camada 1: Fundação (Environment & Acessos)
* **Descrição**: Definição do ambiente de banco de dados e isolamento de acessos.
* **Infraestrutura**: PostgreSQL hospedado no Supabase, garantindo um ambiente seguro e escalável.
* **Segurança**: Credenciais de conexão isoladas via variáveis de ambiente (`.env`), sem exposição de chaves ou senhas no controle de versão.

### Camada 2: Contrato de Dados (Schema & Estrutura)
* **Descrição**: Modelagem relacional e estruturação rígida dos dados do domínio de pagamentos.
* **Tabelas Principais**:
  * `customers`: Cadastro de clientes.
  * `accounts`: Contas vinculadas aos clientes com controle de saldo e status.
  * `cards`: Cartões associados às contas.
  * `merchants`: Lojistas e estabelecimentos comerciais.
  * `transactions`: Histórico de transações financeiras com registro de valores e horários (`timestamp`).

### Camada 3: Ingestão (Origem & Seed Determinístico)
* **Descrição**: Carga inicial e preparação para captura de eventos transacionais.
* **Seed Carregado**: 
  * Clientes, contas, cartões e lojistas populados de forma determinística para testes reproduzíveis.
* **Evidência de Execução**: Tabelas criadas com sucesso e dados inseridos no Supabase sem erros de sintaxe ou restrições de chave estrangeira.

### Camada 4: Processamento & Regras de Negócio
* **Descrição**: Transformação e validação de regras de pagamento.
* **Lógica Aplicada**: Estruturação de consultas para monitoramento de volume transacional e identificação de padrões suspeitos (como múltiplas transações em curto espaço de tempo no mesmo cartão).

### Camada 5: Operação & Confiabilidade
* **Descrição**: Monitoramento do estado do banco, integridade relacional e boas práticas de FinOps (custo zero utilizando infraestrutura gratuita do Supabase).

---

## 🚀 Como Executar o Projeto do Zero

1. **Clone o repositório**:
   ```bash
   git clone [https://github.com/SEU-USUARIO/SEU-REPOSITORIO.git](https://github.com/SEU-USUARIO/SEU-REPOSITORIO.git)
   cd SEU-REPOSITORIO

## Conectar ao Supabase pelo VS Code

1. Abra esta pasta no VS Code e instale as extensões recomendadas: SQLTools e SQLTools PostgreSQL/Cockroach Driver.
2. No painel SQLTools, selecione a conexão `Supabase - seutreinamento-pipeline` e conecte.
3. Quando solicitado, informe a senha do banco configurada no Supabase. A senha não fica salva nas configurações do workspace.
4. Abra um arquivo `.sql` e use o comando de execução do SQLTools para executar a consulta na conexão ativa.

O perfil de conexão já está configurado em `.vscode/settings.json`. A conexão exige acesso de rede ao endpoint PostgreSQL do Supabase.
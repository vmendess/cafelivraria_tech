# Guia de Instalação

Este guia explica como configurar e utilizar o banco de dados **Cafelivraria Tech**.

---

## Pré-Requisitos

1. **SQL Server**
   - Instale o [SQL Server Express](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads) ou uma versão superior.
   - Durante a instalação, ative o **SQL Server Authentication** (autenticação mista).

2. **SQL Server Management Studio (SSMS)**
   - Faça o download e instale o [SSMS](https://learn.microsoft.com/pt-br/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16).

3. **Clonar o Repositório**
   - Certifique-se de que o [Git](https://git-scm.com/) está instalado no seu computador.
   - Clone o repositório com o comando:
     ```bash
     git clone https://github.com/seu-usuario/cafelivraria_tech.git
     ```

---

## Passo a Passo

### **1. Abra o SSMS**
   - Conecte-se à sua instância do SQL Server usando o **SQL Server Authentication** ou as credenciais configuradas.

### **2. Carregue o Script SQL**
   - Localize o arquivo `SQLQuery1.sql` na pasta do repositório clonado.
   - Abra o arquivo no SSMS:
     - Clique em **File > Open > File** e selecione o arquivo.
     - Ou arraste o arquivo diretamente para o editor do SSMS.

### **3. Configure o Banco de Dados**
   - Antes de executar o script, certifique-se de que não há um banco com o mesmo nome existente.
   - Para executar o script:
     1. Selecione todo o código no editor (`Ctrl + A`).
     2. Clique em **Execute** (ou pressione `F5`).

### **4. Verifique a Criação**
   - Após executar o script:
     - Certifique-se de que o banco de dados chamado `cafelivraria_tech` foi criado.
     - Confira se as tabelas foram criadas:
       - Clique em **Databases > cafelivraria_tech > Tables** no painel esquerdo do SSMS.
     - Teste consultas simples, como:
       ```sql
       SELECT * FROM clientes;
       ```

### **5. Insira Dados e Teste Funcionalidades**
   - O script inclui inserções de dados e funcionalidades avançadas. Teste:
     - **Views:** Liste os clientes que compraram produtos em 2024:
       ```sql
       SELECT * FROM clientes_produtos_2024;
       ```
     - **Triggers:** Insira dados em `livros_comprados` e verifique a tabela `logs` para ver as ações registradas.
     - **Procedures:** Execute a procedure `listar_servicos_cliente`:
       ```sql
       EXEC listar_servicos_cliente @id_cliente = 1;
       ```

---

## Dicas para Solução de Problemas

- **Erro de Conexão ao SQL Server:**
  - Certifique-se de que o serviço do SQL Server está em execução.
  - Verifique as configurações de autenticação (usuário/senha).

- **Erro ao Executar o Script:**
  - Certifique-se de que o script foi aberto no editor correto e o banco de dados `cafelivraria_tech` está selecionado no SSMS.

- **Banco de Dados Não Criado:**
  - Certifique-se de que as permissões do usuário atual permitem criar bancos de dados.

---

## Exploração dos Diagramas

Os diagramas ajudam a entender a estrutura do banco de dados:

1. **Diagrama Lógico**
   - Localizado em `livraria_cafe_tech_logico.png`.
   - Representa as tabelas e seus relacionamentos, com as chaves primárias e estrangeiras.

2. **Diagrama Conceitual**
   - Localizado em `livraria_cafe_tech_conceitual.png`.
   - Mostra as entidades, seus atributos e como elas se conectam em um nível mais abstrato.

---

## Resultados Esperados

Após a execução do script, você terá:

1. Um banco de dados funcional com:
   - Modelo desnormalizado inicial.
   - Modelo físico normalizado.

2. Tabelas preenchidas com dados de exemplo.

3. Funcionalidades avançadas, como views, triggers e procedures, prontas para uso.

Se precisar de mais ajuda, entre em contato ou consulte a documentação adicional no repositório.

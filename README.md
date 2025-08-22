🛒 E-commerce Database Project
Este projeto consiste em um sistema de banco de dados relacional para uma plataforma de e-commerce, implementado em MySQL.

📋 Descrição do Projeto
Contexto
O sistema foi desenvolvido para gerenciar todas as operações de um e-commerce, incluindo cadastro de clientes, produtos, pedidos, pagamentos e controle de estoque. O esquema relacional foi projetado para atender às necessidades de um comércio eletrônico completo.

Modelo Conceitual
O modelo inclui entidades principais como:

Clientes: Informações pessoais e de contato

Produtos: Detalhes dos itens à venda

Pedidos: Registro das compras dos clientes

Pagamentos: Controle das transações financeiras

Fornecedores: Dados dos parceiros comerciais

Estoque: Gestão de inventário

Modelo Relacional
O esquema relacional foi implementado com as seguintes tabelas:

Cliente, ClientePF

Produto, Fornecedor, Terceiro

Pedido, Item_pedido

Pagamento, Entrega

Estoque, Produto_Estoque

Tabelas de relacionamento: Fornecedor_Produto, Terceiro_Produto

📊 Principais Funcionalidades
Consultas Implementadas
Recuperações simples com SELECT

Filtros com WHERE

Atributos derivados com expressões

Ordenações com ORDER BY

Condições de filtro com HAVING

Junções complexas entre tabelas

Exemplos de Queries
Listagem de clientes com idade calculada

Relatório financeiro mensal

Pedidos com detalhes completos (cliente + produtos + pagamento)

Análise de vendas por categoria

Controle de pagamentos e status

🗃️ Estrutura do Banco de Dados
text
ecommerce/
├── Cliente
├── Produto
├── Pedido
├── Item_pedido
├── Pagamento
├── Fornecedor
├── Estoque
└── Tabelas de relacionamento
📈 Queries de Análise
O projeto inclui queries analíticas para:

Ticket médio por pedido

Receita por período

Produtos mais vendidos

Status de pagamentos

Controle de entregas

🔧 Tecnologias Utilizadas
MySQL

Linguagem SQL

Modelagem relacional

Consultas complexas

📝 Notas de Desenvolvimento
O projeto foi desenvolvido seguindo boas práticas de modelagem de dados, com:

Chaves primárias e estrangeiras adequadas

Constraints de integridade

Índices para performance

Normalização até a 3ª Forma Normal

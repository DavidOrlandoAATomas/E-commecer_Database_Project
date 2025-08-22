-- Script do ecommerce

create database ecommerce;

-- tabela cliente

create table Cliente(
cliente_id int not null auto_increment,
Pnome varchar(15) not null,
Mnome varchar(15) not null,
Sobrenome varchar(15) not null,
BI char(13) not null,
Email varchar(45) not null,
Endereço varchar(30) not null,
Data_Nascimento date not null,
constraint unique_bi_cliente unique(BI), 
constraint unique_email_cliente unique(Email),
constraint pk_Cliente_id primary key (cliente_id, BI)
);
-- tabela fornecedor

create table Fornecedor(
fornecedor_id int not null auto_increment,
Razao_social varchar(45) not null,
CNPJ varchar(45) not null unique,
Telefone char(9),
constraint pk_fornecedor_id primary key (forncedor_id)
);

-- tabela produto

create table Produto(
produto_id int not null auto_increment,
Nome varchar(15) not null,
Categoria varchar(15) not null,
Descricao varchar(45) not null,
Valor_unit decimal(10, 2) not null,
constraint pk_produto_id primary key (produto_id)
);

-- tabela terceiro

create table Terceiro(
terceiro_id int not null auto_increment,
Razao_Social varchar(45) not null unique,
Localizacao varchar(45) not null,
CNPJ varchar(45) not null unique,
constraint pk_terceiro_id primary key (terceiro_id)
);

-- tabela pedido

create table Pedido(
pedido_id int not null auto_increment,
cliente_id int not null,
Descricao varchar(255) not null,
Valor_total decimal(10, 2) not null,
Data_pedido date not null,
constraint pk_pedido_id primary key (pedido_id),
constraint fk_pedido_cliente_id foreign key (cliente_id) 
references Cliente(cliente_id)
);

-- tabela item_pedido

create table Item_pedido(
pedido_id int not null,
produto_id int not null,
Quantidade int not null,
Valor_unit decimal(10, 2) not null,
constraint pk_item_pedidoid primary key (pedido_id, produto_id)
);

-- tabela Forncedor-Produto

create table Fornecedor_Produto(
fornecedor_id int not null,
produto_id int not null,
constraint pk_fornecedor_produto_id primary key (fornecedor_id, produto_id),
constraint fk_fornecdedor_id foreign key (fornecedor_id) references Fornecedor(fornecedor_id),
constraint fk_produto_id foreign key (produto_id) references Produto(produto_id)
);

-- Terceiro-Produto

create table Terceiro_Produto(
terceiro_id int not null,
produto_id int not null,
constraint pk_terceiro_produto_id primary key (terceiro_id, produto_id),
constraint fk_terceiro_id foreign key (terceiro_id) references Terceiro(terceiro_id),
constraint fk_produto_id foreign key (produto_id) references Produto(produto_id)
);

-- tabela Estoque

create table Estoque(
estoque_id int not null auto_increment,
Quantidade int not null,
constraint pk_estoque_id primary key (estoque_id)
);

-- Produto-Estoque

create table Produto_Estoque(
produto_id int not null,
estoque_id int not null,
Quantidade int not null,
constraint pk_produto_estoque_id primary key (produto_id, estoque_id)
);

-- tabela Cliente PF

create table ClientePF(
clientepf_id int not null auto_increment,
cliente_id int not null,
BI char(13) not null,
Data_Nascimento date not null,
constraint pk_clientepf_id primary key (clientepf_id),
constraint fk_cliente_id foreign key (cliente_id) references Cliente(cliente_id)
);

-- tabela pagamento

create table Pagamento(
pagamento_id int not null auto_increment,
pedido_id int not null,
Tipo_pagamento enum('Cartão', 'Check', 'Transferência', 'Outro') not null,
Status_pagamento enum('Pendente', 'Confirmado', 'Cancelado') not null default 'Pendente',
Detalhes varchar(255),
 constraint pk_pagamento_id primary key (pagamento_id),
 constraint fk_pedido_id foreign key (pedido_id) references Pedido(pedido_id)
);

-- tabela entrega

create table Entrega(
entrega_id int not null auto_increment, 
pedido_id int not null,
Status_entrega enum("Pendente", "Enviado", "Entregue", "Cancelado"),
Rastreio varchar(255) not null,
Data_envio date not null,
Data_entrega date not null,
constraint pk_entrega primary key (entrega_id),
constraint fk_pedido_id foreign key (pedido_id) references Pedido(pedido_id)
);
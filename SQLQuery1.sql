--Criando o banco de dados
CREATE DATABASE cafelivraria_tech;

--Usando o banco de dados
USE cafelivraria_tech;

-- TABELA DESNORMALIZADA
CREATE TABLE livrariacafe_desnormalizada (
    id_cliente INT,
    nome_cliente VARCHAR(100),
    telefone_cliente VARCHAR(50),
    endereco_cliente VARCHAR(200),
    id_livro INT,
    titulo_livro VARCHAR(200),
    autor_livro VARCHAR(100),
    genero_livro VARCHAR(50),
    preco_livro DECIMAL(10,2),
    id_produto INT,
    nome_produto VARCHAR(200),
    tipo_produto VARCHAR(150),
    preco_produto DECIMAL(10,2),
    id_servico INT,
    descricao_servico VARCHAR(200),
    preco_servico DECIMAL(10,2),
    data_compra_livro DATE,
    data_compra_produto DATE,
    data_servico DATE
);

-- INSERINDO DADOS NA TABELA DESNORMALIZADA (Exemplo)
INSERT INTO livrariacafe_desnormalizada (
    id_cliente, nome_cliente, telefone_cliente, endereco_cliente, 
    id_livro, titulo_livro, autor_livro, genero_livro, preco_livro, 
    id_produto, nome_produto, tipo_produto, preco_produto, 
    id_servico, descricao_servico, preco_servico, 
    data_compra_livro, data_compra_produto, data_servico
) 
VALUES 
-- Cliente 1 comprando "C�digo Limpo" e "Caneta Esferogr�fica Azul", com Wi-Fi Premium
(1, 'Joaquim Felix da Silva', '(88) 95558-0052', 'Rua Doutor Felix, n 8',
 1, 'C�digo Limpo: Habilidades Pr�ticas do Agile Software', 'Robert C. Martin', 'Tecnologia', 65.90,
 1, 'Caneta Esferogr�fica Azul', 'Papelaria', 2.50,
 1, 'Conex�o Wi-Fi Premium', 10.00,
 '2024-11-01', '2024-11-01', '2024-11-01'),

-- Cliente 2 comprando "O Programador Pragm�tico" e "Mochila para Notebook", com carregamento de dispositivos m�veis
(2, 'Elizeu da Maria', '(75) 98844-5533', 'Rua Amaral dos Pinheiros, n 10',
 2, 'O Programador Pragm�tico', 'Andrew Hunt, David Thomas', 'Tecnologia', 70.50,
 12, 'Mochila para Notebook', 'Acess�rios', 99.50,
 2, 'Carregamento de Dispositivos M�veis', 5.00,
 '2024-11-02', '2024-11-02', '2024-11-02');

-- Consulta na tabela desnormalizada
SELECT *FROM livrariacafe_desnormalizada;

-- Exclus�o da tabela desnormalizada
DROP TABLE livrariacafe_desnormalizada;

--Criando a tabela clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    telefone_cliente VARCHAR(50),
    endereco_cliente VARCHAR(200)
);

--Criando a tabela livros
CREATE TABLE livros (
    id_livro INT PRIMARY KEY,
    titulo_livro VARCHAR(200),
    autor_livro VARCHAR(100),
    genero_livro VARCHAR(50),
    preco_livro DECIMAL(10,2)
);

--Criando a tabela produtos
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(200),
    tipo_produto VARCHAR(150),
    preco_produto DECIMAL(10,2)
);

--Criando a tabela servicos
CREATE TABLE servicos (
    id_servico INT PRIMARY KEY,
    descricao_servico VARCHAR(200),
    preco_servico DECIMAL(10,2)
);

--Criando a tabela livros_comprados
CREATE TABLE livros_comprados (
    id_cliente INT,
    id_livro INT,
    data_compra_livro DATE,
    PRIMARY KEY (id_cliente, id_livro),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro)
);

--Criando a tabela produtos_comprados
CREATE TABLE produtos_comprados (
    id_cliente INT,
    id_produto INT,
    data_compra_produto DATE,
    PRIMARY KEY (id_cliente, id_produto),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

--Criando a tabela servicos_realizados
CREATE TABLE servicos_realizados (
    id_cliente INT,
    id_servico INT,
    data_servico DATE,
    PRIMARY KEY (id_cliente, id_servico),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_servico) REFERENCES Servicos(id_servico)
);


CREATE TABLE logs (
    id_log INT PRIMARY KEY, 
    descricao_log VARCHAR(200),  
    data_log DATE  
);

-- Inserindo dados na tabela clientes
INSERT INTO clientes (id_cliente, nome_cliente, telefone_cliente, endereco_cliente) VALUES 
(1, 'Vinicius Mendes', '(85) 99695-2107', 'Rua 8 de setembro, 1135 - Fortaleza, CE'),
(2, 'Alex Souza', '(85) 98559-4744', 'Av. Dom Lu�s, 456 - Fortaleza, CE'),
(3, 'Ryan Gurgel', '(85) 96543-2109', 'Rua Principal, 789 - Fortaleza, CE'),
(4, 'Elidio Nascimento', '(85) 95432-1098', 'Rua do Com�rcio, 234 - Fortaleza, CE'),
(5, 'Lucas Feitosa', '(85) 94321-0987', 'Av. Central, 567 - Fortaleza, CE'),
(6, 'Marcos Bandeira', '(85) 93210-8765', 'Rua do Porto, 345 - Fortaleza, CE'),
(7, 'Ricardo Almeida', '(85) 92109-7654', 'Setor Comercial, 678 - Fortaleza, CE'),
(8, 'Juliana Rocha', '(85) 91098-6543', 'Av. Boa Viagem, 901 - Fortaleza, CE'),
(9, 'Fernando Oliveira', '(85) 90987-5432', 'Rua da Cidade, 234 - Fortaleza, CE'),
(10, 'Carla Mendes', '(85) 89876-4321', 'Rua das Dunas, 567 - Fortaleza, CE'),
(11, 'Rafael Lima', '(85) 88765-3210', 'Av. Principal, 890 - Fortaleza, CE'),
(12, 'Amanda Pires', '(85) 87654-2109', 'Rua do Com�rcio, 123 - Fortaleza, CE'),
(13, 'Rodrigo Castro', '(85) 86543-1098', 'Av. Integra��o, 456 - Fortaleza, CE'),
(14, 'Camila Nunes', '(85) 85432-0987', 'Rua do Mar, 789 - Fortaleza, CE'),
(15, 'Lucas Barbosa', '(85) 84321-9876', 'Av. Beira-Mar, 234 - Fortaleza, CE'),
(16, 'Patr�cia Reis', '(85) 83210-8765', 'Rua da Amaz�nia, 567 - Fortaleza, CE'),
(17, 'Gustavo Martins', '(85) 82109-7654', 'Av. Jarbas Passarinho, 890 - Fortaleza, CE'),
(18, 'Sandra Cardoso', '(85) 81098-6543', 'Rua do Sert�o, 345 - Fortaleza, CE'),
(19, 'Bruno Pereira', '(85) 80987-5432', 'Av. Tocantins, 678 - Fortaleza, CE'),
(20, 'Let�cia Campos', '(85) 79876-4321', 'Rua do Centro, 901 - Fortaleza, CE');

-- Inserir um cliente sem compras
INSERT INTO clientes (id_cliente, nome_cliente, telefone_cliente, endereco_cliente) 
VALUES (21, 'Xuxa', '(85) 98765-4321', 'Rua X, Fortaleza, CE');

-- Inserindo dados na tabela livros
INSERT INTO livros (id_livro, titulo_livro, autor_livro, genero_livro, preco_livro) VALUES
(1, 'C�digo Limpo: Habilidades Pr�ticas do Agile Software', 'Robert C. Martin', 'Tecnologia', 65.90),
(2, 'O Programador Pragm�tico', 'Andrew Hunt, David Thomas', 'Tecnologia', 70.50),
(3, 'Intelig�ncia Artificial: Uma Abordagem Moderna', 'Stuart Russell, Peter Norvig', 'IA', 90.00),
(4, 'Aprendizado Profundo', 'Ian Goodfellow, Yoshua Bengio, Aaron Courville', 'IA', 110.20),
(5, 'A Arte da Programa��o de Computadores', 'Donald Knuth', 'Algoritmos', 120.75),
(6, 'C�digo: A Linguagem Oculta do Hardware e Software', 'Charles Petzold', 'Tecnologia', 55.90),
(7, 'Padr�es de Projetos: Solu��es Reutiliz�veis de Software Orientado a Objetos', 'Erich Gamma e outros', 'Engenharia de Software', 85.50),
(8, 'Os Inovadores: Uma Biografia da Revolu��o Digital', 'Walter Isaacson', 'Biografia Tecnol�gica', 48.90),
(9, 'Neuromancer', 'William Gibson', 'Fic��o Cient�fica', 36.60),
(10, '1984', 'George Orwell', 'Fic��o Cient�fica', 32.50),
(11, 'Homo Deus: Uma Breve Hist�ria do Amanh�', 'Yuval Noah Harari', 'Futuro e Tecnologia', 49.90),
(12, 'Como Criar uma Mente', 'Ray Kurzweil', 'IA', 45.00),
(13, 'Vida 3.0: Ser Humano na Era da Intelig�ncia Artificial', 'Max Tegmark', 'IA', 54.90),
(14, 'A Singularidade Est� Pr�xima', 'Ray Kurzweil', 'Tecnologia e Futuro', 60.00),
(15, 'O Projeto F�nix: Um Romance Sobre TI, DevOps e Ajudar seu Neg�cio a Vencer', 'Gene Kim e outros', 'DevOps', 50.75),
(16, 'Startup Enxuta', 'Eric Ries', 'Empreendedorismo', 38.90),
(17, 'A Gera��o Superficial: O Que a Internet Est� Fazendo com Nossos C�rebros', 'Nicholas Carr', 'Tecnologia', 42.90),
(18, 'Algoritmos Para Viver', 'Brian Christian, Tom Griffiths', 'Tecnologia e Comportamento', 40.00),
(19, 'Revolu��o Blockchain', 'Don Tapscott, Alex Tapscott', 'Blockchain', 55.50),
(20, 'R�pido e Devagar: Duas Formas de Pensar', 'Daniel Kahneman', 'Comportamento e Tecnologia', 39.75);

-- Inserindo livros que n�o ser�o comprados
INSERT INTO livros (id_livro, titulo_livro, autor_livro, genero_livro, preco_livro) VALUES
(21, 'An�lise Matem�tica de Algoritmos de Criptografia Qu�ntica', 'Dr. Marcos Quantum', 'Tecnologia Avan�ada', 275.50),
(22, 'Arquitetura de Compiladores em VHDL para Sistemas Embarcados', 'Prof. Elena Compiladora', 'Engenharia de Software', 195.75),
(23, 'Teoria Computacional de Aut�matos em Grafos Hipercomplexos', 'Dr. Ricardo Matem�tico', 'Ci�ncia da Computa��o', 220.90),
(24, 'Modelagem Matem�tica de Redes Neurais Probabil�sticas de Quinta Gera��o', 'Profa. Ana Redes', 'IA Te�rica', 189.60),
(25, 'Simula��es Computacionais em F�sica de Part�culas Usando Haskell', 'Dr. Jo�o Simulador', 'Computa��o Cient�fica', 210.30);

-- Inserindo dados na tabela produtos
INSERT INTO produtos (id_produto, nome_produto, tipo_produto, preco_produto) VALUES
(1, 'Caneta Esferogr�fica Azul', 'Papelaria', 2.50),
(2, 'Caderno Universit�rio 10 Mat�rias', 'Papelaria', 25.90),
(3, 'Mochila Escolar', 'Acess�rios', 89.99),
(4, 'Calculadora Cient�fica', 'Eletr�nicos', 75.00),
(5, 'Estojo Escolar', 'Acess�rios', 35.50),
(6, 'L�pis de Cor 24 Cores', 'Papelaria', 18.75),
(7, 'Mouse Sem Fio', 'Eletr�nicos', 55.90),
(8, 'Pendrive 64GB', 'Eletr�nicos', 69.99),
(9, 'Agenda 2024', 'Papelaria', 32.50),
(10, 'R�gua de 30cm', 'Papelaria', 4.90),
(11, 'Fones de Ouvido Bluetooth', 'Eletr�nicos', 129.90),
(12, 'Mochila para Notebook', 'Acess�rios', 99.50),
(13, 'Papel A4 (Resma)', 'Papelaria', 22.80),
(14, 'Carregador Port�til 10000mAh', 'Eletr�nicos', 79.99),
(15, 'Borracha Branca', 'Papelaria', 1.50),
(16, 'Caixa de Som Port�til', 'Eletr�nicos', 89.90),
(17, 'Marcador de Texto', 'Papelaria', 3.20),
(18, 'Tablet 10 Polegadas', 'Eletr�nicos', 599.99),
(19, 'Fich�rio Universit�rio', 'Papelaria', 45.50),
(20, 'Powerbank 20000mAh', 'Eletr�nicos', 129.50);

-- Inserindo dados na tabela servi�os
INSERT INTO servicos (id_servico, descricao_servico, preco_servico) VALUES
(1, 'Conex�o Wi-Fi Premium', 10.00),
(2, 'Carregamento de Dispositivos M�veis', 5.00),
(3, 'Impress�o e C�pia de Documentos (A4)', 0.50),
(4, 'Digitaliza��o de Documento para PDF', 5.00),
(5, 'Aluguel de Notebook para Uso no Local', 30.00),
(6, 'Assist�ncia em Configura��o de e-Readers', 20.00),
(7, 'Impress�o de Cart�es de Visita (100 unidades)', 40.00),
(8, 'Impress�o 3D de Marcadores de P�gina', 30.00),
(9, 'Assist�ncia para Leitura de eBooks', 15.00),
(10, 'Backup de Arquivos Pessoais', 10.00),
(11, 'Configura��o de Leitores de QR Code para Pagamento', 25.00),
(12, 'Apoio para Instala��o de Aplicativos', 15.00),
(13, 'Aluguel de Espa�o para Reuni�es com Wi-Fi', 50.00),
(14, 'Venda de Acess�rios para Dispositivos (Carregadores, Fones de Ouvido)', 30.00),
(15, 'Digitaliza��o de Livros para Formato Digital', 50.00),
(16, 'Transcri��o de �udio para Texto', 40.00),
(17, 'Suporte B�sico para Dispositivos M�veis', 25.00),
(18, 'Consultoria em Organiza��o de Arquivos Digitais', 50.00),
(19, 'Apoio para Acesso a Plataformas de Streaming', 15.00),
(20, 'Venda de Livros Digitais Exclusivos', 40.00);


-- Inserindo dados na tabela livros_comprados
INSERT INTO livros_comprados (id_cliente, id_livro, data_compra_livro) VALUES
(1, 1, '2024-02-15'),
(2, 2, '2024-01-20'),
(3, 3, '2024-03-10'),
(4, 4, '2024-02-28'),
(5, 5, '2024-01-05'),
(6, 6, '2024-02-01'),
(7, 7, '2024-03-15'),
(8, 8, '2024-01-10'),
(9, 9, '2024-02-20'),
(10, 10, '2024-01-30'),
(11, 11, '2024-03-05'),
(12, 12, '2024-02-10'),
(13, 13, '2024-01-15'),
(14, 14, '2024-03-20'),
(15, 15, '2024-02-05'),
(16, 16, '2024-01-25'),
(17, 17, '2024-03-01'),
(18, 18, '2024-02-25'),
(19, 19, '2024-01-12'),
(20, 20, '2024-03-12');

-- Inserindo dados na tabela produtos_comprados
INSERT INTO produtos_comprados (id_cliente, id_produto, data_compra_produto) VALUES
(1, 2, '2024-02-15'),
(2, 3, '2024-01-22'),
(3, 1, '2024-03-05'),
(4, 4, '2024-02-10'),
(5, 5, '2024-01-15'),
(6, 6, '2024-02-20'),
(7, 7, '2024-01-05'),
(8, 8, '2024-03-15'),
(9, 9, '2024-02-01'),
(10, 10, '2024-01-30'),
(11, 11, '2024-03-10'),
(12, 12, '2024-02-05'),
(13, 13, '2024-01-20'),
(14, 14, '2024-03-01'),
(15, 15, '2024-02-25'),
(16, 16, '2024-01-10'),
(17, 17, '2024-03-20'),
(18, 18, '2024-02-15'),
(19, 19, '2024-01-25'),
(20, 20, '2024-03-05');

-- Inserindo dados na tabela servicos_realizados
INSERT INTO servicos_realizados (id_cliente, id_servico, data_servico) VALUES
(1, 1, '2024-02-16'),
(2, 2, '2024-01-25'),
(3, 3, '2024-03-12'),
(4, 4, '2024-02-29'),
(5, 5, '2024-01-10'),
(6, 6, '2024-02-05'),
(7, 7, '2024-01-15'),
(8, 8, '2024-03-01'),
(9, 9, '2024-02-20'),
(10, 10, '2024-01-30'),
(11, 11, '2024-03-15'),
(12, 12, '2024-02-10'),
(13, 13, '2024-01-20'),
(14, 14, '2024-03-05'),
(15, 15, '2024-02-25'),
(16, 16, '2024-01-05'),
(17, 17, '2024-03-20'),
(18, 18, '2024-02-15'),
(19, 19, '2024-01-25'),
(20, 20, '2024-03-10');

-- SELECTS
SELECT * FROM clientes;
SELECT * FROM livros;
SELECT * FROM produtos;
SELECT * FROM servicos;
SELECT * FROM livros_comprados;
SELECT * FROM produtos_comprados;
SELECT * FROM servicos_realizados;



-- 1. Update: Alterando dados em uma tabela.

-- Atualizar o pre�o do livro com id 1
UPDATE livros
SET preco_livro = 75.00
WHERE id_livro = 1;

-- Atualizar o nome de um cliente com id 5
UPDATE clientes
SET nome_cliente = 'Lucas Feitosa Silva'
WHERE id_cliente = 5;

-- 2. Select: Consultando dados com filtros e ordena��es.

-- Consultar todos os livros com pre�o maior que 50 e ordenar por pre�o crescente
SELECT id_livro, titulo_livro, autor_livro, preco_livro
FROM livros
WHERE preco_livro > 50
ORDER BY preco_livro ASC;

-- 3. Delete: Removendo registros com seguran�a.

-- Excluir os registros que fazem refer�ncia ao cliente em todas as tabelas dependentes
DELETE FROM livros_comprados WHERE id_cliente = 1;
DELETE FROM produtos_comprados WHERE id_cliente = 1;
DELETE FROM servicos_realizados WHERE id_cliente = 1;

-- Agora, podemos excluir o cliente, j� que n�o h� mais registros dependentes
DELETE FROM clientes WHERE id_cliente = 1;


-- 4. Inner Join, Left Join, Right Join: Jun��es entre tabelas.

-- INNER JOIN: Listar todos os clientes que compraram livros
SELECT c.id_cliente, c.nome_cliente, l.titulo_livro
FROM clientes c
INNER JOIN livros_comprados lc ON c.id_cliente = lc.id_cliente
INNER JOIN livros l ON lc.id_livro = l.id_livro;

-- LEFT JOIN: Listar todos os livros, inclusive os que n�o foram comprados
SELECT l.id_livro, l.titulo_livro, c.nome_cliente
FROM livros l
LEFT JOIN livros_comprados lc ON l.id_livro = lc.id_livro
LEFT JOIN clientes c ON lc.id_cliente = c.id_cliente;

-- RIGHT JOIN: Todos os clientes, inclusive os que n�o compraram nenhum livro
SELECT c.id_cliente, c.nome_cliente, l.titulo_livro
FROM livros l
RIGHT JOIN livros_comprados lc ON l.id_livro = lc.id_livro
RIGHT JOIN clientes c ON lc.id_cliente = c.id_cliente;

-- 5. View: Criando uma view para consultas frequentes.
-- Criar uma view para listar os clientes que compraram produtos em 2024
CREATE VIEW clientes_produtos_2024 AS
SELECT c.id_cliente, c.nome_cliente, p.nome_produto, pc.data_compra_produto
FROM clientes c
INNER JOIN produtos_comprados pc ON c.id_cliente = pc.id_cliente
INNER JOIN produtos p ON pc.id_produto = p.id_produto
WHERE YEAR(pc.data_compra_produto) = 2024;

SELECT * FROM clientes_produtos_2024;

-- 6. Procedure: Criando uma stored procedure com par�metros.
-- Criar uma procedure que lista os servi�os realizados para um cliente
CREATE PROCEDURE listar_servicos_cliente (@id_cliente INT)
AS
BEGIN
    SELECT s.id_servico, s.descricao_servico, sr.data_servico
    FROM servicos_realizados sr
    INNER JOIN servicos s ON sr.id_servico = s.id_servico
    WHERE sr.id_cliente = @id_cliente;
END;

EXEC listar_servicos_cliente @id_cliente = 1;

-- 7. Trigger: Criando um trigger para registrar a��es.
-- Criar um trigger para registrar compras de livros em um log
CREATE TRIGGER log_compra_livro
ON livros_comprados
AFTER INSERT
AS
BEGIN
    DECLARE @id_cliente INT, @id_livro INT, @data_compra DATE;
    
    SELECT @id_cliente = id_cliente, @id_livro = id_livro, @data_compra = data_compra_livro
    FROM inserted;

    -- Inserir no log
    INSERT INTO logs (descricao_log, data_log)
    VALUES ('Cliente ' + CAST(@id_cliente AS VARCHAR) + ' comprou o livro ' + CAST(@id_livro AS VARCHAR), GETDATE());
END;

-- 8. Vari�veis: Declarando e utilizando vari�veis.
-- Declara��o EXPL�CITA de vari�veis
DECLARE @id_cliente INT;
DECLARE @total_gasto DECIMAL(10,2);

-- Definir o valor da vari�vel
SET @id_cliente = 1;

-- Calcular total gasto em livros
SET @total_gasto = (
    SELECT SUM(l.preco_livro)
    FROM livros_comprados lc
    INNER JOIN livros l ON lc.id_livro = l.id_livro
    WHERE lc.id_cliente = @id_cliente
);

-- Exibir o valor total gasto
SELECT @total_gasto AS TotalGasto;
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE IF NOT EXISTS Livros (
    livros_id INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    editora VARCHAR(255),
    ano_publicacao INT,
    isbn VARCHAR(13)
);

ALTER TABLE Livros CHANGE isbn isbn VARCHAR(17);

ALTER TABLE Livros MODIFY livros_id INT AUTO_INCREMENT;

CREATE TABLE IF NOT EXISTS autor (
	autor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS editora(
	editora_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

ALTER TABLE Livros DROP COLUMN autor, DROP COLUMN editora, ADD COLUMN autor_id INT, ADD COLUMN editora_id INT, ADD CONSTRAINT autor_id FOREIGN KEY autor(autor_id) REFERENCES autor(autor_id), ADD CONSTRAINT editora_id FOREIGN KEY editora(editora_id) REFERENCES editora(editora_id);

INSERT INTO autor(nome) VALUES
("John Green"),("J.K. Rowling"),("J.R.R Tolkien"),("J.D. Salinger"),("George Orwell"),("Rick Riordan");
INSERT INTO editora(nome) VALUES
("Intríseca"),("Rocco"),("Martins Fontes"),("Little, Brown and Company"),("Companhia Editora Nacional");

INSERT INTO autor(nome) VALUES
("João Guimarães Rosa"),("Machado de Assis"),("Graciliano Ramos"),("Aluísio Azevedo"),("Mário de Andrade");

INSERT INTO editora(nome) VALUES
("Nova Fronteira"),("Companhia das Letras"),("Martin Claret"),("Penguin Companhia");

INSERT INTO Livros (titulo, autor_id, editora_id, ano_publicacao, isbn) VALUES 
('A Culpa é das Estrelas', 1, 1, 2012, '978-85-8057-346-6'),
('Harry Potter e a Pedra Filosofal', 2, 2, 1997, '9788532511010'),
('O Senhor dos Anéis: A Sociedade do Anel', 3, 3, 1954, '9788533603149'),
('The Catcher in the Rye', 4, 4, '1951', '9780316769488'),
('1984', 5, 5, 1949, '978-85-221-0616-9'),
('Percy Jackson e o Ladrão de Raios', 6, 6, 2005, '9788598078355');


INSERT INTO 
Livros (titulo, autor_id, editora_id, ano_publicacao, isbn) 
VALUES 
('Grande Sertão: Veredas', 7, 6, 1956, '978-85-209-2325-1'),
('Memórias Póstumas de Brás Cubas', 8, 7, 1881, '9788535910663'),
('Vidas Secas', 9, 5, 1938, '9788572326972'),
('O Alienista', 8, 8, 1882, '9788572327429'),
('O Cortiço', 10, 9, 1890, '9788579027048'),
('Dom Casmurro', 8, 9, 1899, '9788583862093'),
('Macunaíma', 11, 5, 1928, '9788503012302');

SELECT Livros.livros_id, Livros.titulo, autor.nome AS autor, editora.nome AS editora, ano_publicacao, isbn FROM ((livros INNER JOIN autor ON livros.autor_id = autor.autor_id) INNER JOIN editora ON livros.editora_id = editora.editora_id) ORDER BY livros_id;


CREATE TABLE bookshelfs (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

INSERT INTO bookshelfs (name) VALUES ('rak1'), ('rak2'), ('rak3'), ('rak4'), ('rak5'), ('rak6'),
('rak7'), ('rak8'), ('rak9'), ('rak10');

SELECT name,id FROM bookshelfs;

CREATE TABLE categories(
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL UNIQUE,
    bookshelf_id INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (bookshelf_id) REFERENCES bookshelfs(id)
);

TABLE categories;

INSERT INTO categories (name, bookshelf_id) VALUES ('action', '1'), ('romance', '2'), ('fantasy', '3'), 
('drama', '4'), ('horror', '5'), ('comedy', '6'), ('science','7'), ('history', '8'), ('mistery', '9'), 
('kids', '10');

SELECT id,name,bookshelf_id FROM categories;

CREATE TABLE books(
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255) NOT NULL UNIQUE,
    category_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

INSERT INTO books (title, category_id) VALUES ('negeri diujung tanduk', '1'), ('dilan', '2'), ('ceros dan batozar', '3'), 
('laskar pelangi', '4'), ('ghost house', '5'), ('warkop dki', '6'), ('ensiklopedia fauna','7'), 
('penaklukan konstatinapel', '8'), ('sherlock holmes', '9'), ('bobo', '10');

SELECT id,title,category_id FROM books;

ROLLBACK;

CREATE TABLE operators (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

INSERT INTO operators (name) VALUES ('dadang'), ('diding'), ('dudung'), ('jajang'), ('jijing'), ('jujung'),
('jojong'), ('jono'), ('junu'), ('jana');

SELECT id,name FROM operators;

CREATE TABLE loanings(
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    book_id INTEGER,
    operator_id INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (operator_id) REFERENCES operators(id)
);

INSERT INTO loanings (book_id, operator_id) VALUES ('1', '1'), ('2', '2'), ('3', '3'), 
('4', '4'), ('5', '5'), ('6', '6'), ('7','7'), ('8', '8'), ('9', '9'), ('10', '10');

TABLE loanings;

SELECT id,book_id, operator_id FROM loanings;
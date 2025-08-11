-- Reset
DROP TABLE IF EXISTS users CASCADE;

DROP TABLE IF EXISTS products CASCADE;

DROP TABLE IF EXISTS orders CASCADE;

-- Create
CREATE TABLE
    users (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL
    );

CREATE TABLE
    products (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        price NUMERIC(10, 2) NOT NULL
    );

CREATE TABLE
    orders (
        id SERIAL PRIMARY KEY,
        user_id INT REFERENCES users (id),
        product_id INT REFERENCES products (id),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- Seed
INSERT INTO
    users (id, name, email)
VALUES
    (123, 'Bob', 'bob@example.org');

INSERT INTO
    products (id, name, price)
VALUES
    (1, 'Mechanical Keyboard', 120),
    (2, 'Ergonomic Chair', 350);

INSERT INTO
    orders (id, user_id, product_id)
VALUES
    (456, 123, 1),
    (789, 123, 2);

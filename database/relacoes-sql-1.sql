-- Active: 1673874129566@@127.0.0.1@3306
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (id, name, email, password)
VALUES
    ("u001", "Camila", "camila@email.com", "camila123"),
    ("u002", "Igor", "igor@email.com", "igorigor");

INSERT INTO phones(id, phone_number, user_id)
VALUES
    ("p001", "5514911111111", "u001"),
    ("p002", "5561922222222", "u002"),
    ("p003", "5514933333333", "u001");

DELETE FROM phones
WHERE user_id = "u004";

SELECT * FROM users;

SELECT * FROM phones;

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;



CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses(id)   
);

INSERT INTO licenses (id, register_number, category)
VALUES
    ("l001", "11111111111", "A"),
    ("l002", "22222222222", "AB"); 

INSERT INTO drivers (id, name, email, password, license_id)
VALUES
    ("d001", "Carlos Bergson", "carlosb@email.com", "carlosbbb", "l001"),
    ("d002", "Tais Zimerer", "zimerertais", "zimerer123", "l002"); 

SELECT * FROM licenses;

SELECT * FROM drivers;

SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;
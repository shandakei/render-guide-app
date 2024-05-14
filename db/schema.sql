-- data modelling
-- define the schema of the database
-- SQL

CREATE DATABASE render_demo;

CREATE TABLE IF NOT EXISTS students (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

-- seeding 
INSERT INTO students (first_name, last_name) VALUES
('Mark', 'Adrian Velasquez'),
('Bernadine', 'Dao'),
('Leonardo', 'Manteit'),
('Georgia', 'Scott'),
('Eric', 'Stuart-Jones'),
('Alexander', 'Klaus Kampfer'),
('Angela', 'Liu'),
('Jen', 'Feng Wong'),
('Ting', 'Li');


-- If you want users logging in, you can create a table for users
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email TEXT UNIQUE,
  password_digest TEXT
);

-- After Running the create_dummy_user.js you can connect to your
-- Render DB and inster the dummy user with the following command
-- INSERT INTO users (email, password_digest) VALUES ('<email>', '<password_digest>');
CREATE TABLE IF NOT EXISTS example (
    id SERIAL PRIMARY KEY,
    character VARCHAR(255) NOT NULL
);

INSERT INTO example (character)
SELECT 'Hello World'
WHERE NOT EXISTS (SELECT 1 FROM example WHERE character = 'Hello World');
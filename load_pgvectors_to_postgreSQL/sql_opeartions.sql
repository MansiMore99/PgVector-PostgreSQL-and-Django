-- Create vector extension
CREATE EXTENSION vector;

-- Create table with vector column
CREATE TABLE items (id bigserial PRIMARY KEY, embedding vector(3));

-- Insert data
INSERT INTO items (embedding) VALUES ('[1,2,3]'), ('[4,5,6]');

-- Query data
SELECT * FROM items ORDER BY embedding <-> '[3,1,2]' LIMIT 5;

-- Update data
COPY items (embedding) FROM STDIN WITH (FORMAT BINARY);

-- Update data with conflict resolution
INSERT INTO items (id, embedding) VALUES (1, '[1,2,3]'), (2, '[4,5,6]')
    ON CONFLICT (id) DO UPDATE SET embedding = EXCLUDED.embedding;



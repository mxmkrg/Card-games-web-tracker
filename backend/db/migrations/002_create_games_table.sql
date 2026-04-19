CREATE TABLE IF NOT EXISTS games (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name varchar(100) NOT NULL,
    description text,
    created_by uuid NOT NULL,
    FOREIGN KEY (created_by) REFERENCES users(id)
);
CREATE TABLE IF NOT EXISTS matches (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    game_id uuid NOT NULL,
    played_at timestamptz NOT NULL,
    FOREIGN KEY (game_id) REFERENCES games(id)
);
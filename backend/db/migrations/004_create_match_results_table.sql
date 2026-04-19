CREATE TABLE IF NOT EXISTS match_results (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    match_id uuid NOT NULL,
    user_id uuid NOT NULL,
    is_winner boolean NOT NULL,
    FOREIGN KEY (match_id) REFERENCES matches(id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
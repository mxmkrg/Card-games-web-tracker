# Card games web tracker

## Core idea

A minimalistic web application to track wins for competitive card and board game nights

## Technical stack

| **Component** | **Technology**       |
| ------------- | -------------------- |
| **Frontend**  | React + Tailwind CSS |
| **Backend**   | Node.js (Express)    |
| **Database**  | PostgreSQL           |
| **Container** | Docker               |

## Core features

- User authentication: Simple login/registration and data save for each user
- Game library: Add or select games from the game library
- Scoreboard: Track matches and the winner from the match to adjust wins on the scoreboard for each game


## Database schema

### Extensions

- `pgcrypto` for `gen_random_uuid()` UUID generation

### Tables

#### users

| Column        | Type          | Constraints / Default                     |
| ------------- | ------------- | ----------------------------------------- |
| id            | uuid          | PK, default `gen_random_uuid()`           |
| username      | varchar(30)   | NOT NULL, UNIQUE                          |
| password_hash | text          | NOT NULL                                  |
| created_at    | timestamptz   | default `now()`                           |

#### games

| Column      | Type         | Constraints / Default           |
| ----------- | ------------ | ------------------------------- |
| id          | uuid         | PK, default `gen_random_uuid()` |
| name        | varchar(100) | NOT NULL                        |
| description | text         | nullable                        |
| created_by  | uuid         | NOT NULL, FK -> `users(id)`     |

#### matches

| Column    | Type        | Constraints / Default           |
| --------- | ----------- | ------------------------------- |
| id        | uuid        | PK, default `gen_random_uuid()` |
| game_id   | uuid        | NOT NULL, FK -> `games(id)`     |
| played_at | timestamptz | NOT NULL                        |

#### match_results

| Column    | Type    | Constraints / Default            |
| --------- | ------- | -------------------------------- |
| id        | uuid    | PK, default `gen_random_uuid()`  |
| match_id  | uuid    | NOT NULL, FK -> `matches(id)`    |
| user_id   | uuid    | NOT NULL, FK -> `users(id)`      |
| is_winner | boolean | NOT NULL                         |

### Relationships

- One `user` can create many `games` (`games.created_by -> users.id`)
- One `game` can have many `matches` (`matches.game_id -> games.id`)
- One `match` can have many `match_results` (`match_results.match_id -> matches.id`)
- One `user` can appear in many `match_results` (`match_results.user_id -> users.id`)
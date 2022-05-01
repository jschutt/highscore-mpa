-- Add game
INSERT INTO game (
  title,
  genre,
  description,
  release_date,
  image_url,
  url_slug
) VALUES
(
  'Tetris',
  'Puzzle',
  'Lorum ipsum dolor and so on',
  1984,
  'https://via.placeholder.com/260x260.png?text=Game',
  'tetris'
);

INSERT INTO game (
  title,
  genre,
  description,
  release_date,
  image_url,
  url_slug
) VALUES
(
  'Pac-Man',
  'Arcade',
  'Lorum ipsum dolor and so on',
  1980,
  'https://via.placeholder.com/260x260.png?text=Game',
  'pac-man'
);

-- Add user
INSERT INTO users (
  first_name,
  last_name,
  highscore,
  highscore_date
) VALUES
(
  'Bruce',
  'Wayne',
  579680,
  '2001-05-24'
);

INSERT INTO users (
  first_name,
  last_name,
  highscore,
  highscore_date
) VALUES
(
  'Clark',
  'Kent',
  1904060,
  '2004-02-04'
);

-- Create relation between game and user
INSERT INTO game_users (game_id, users_id)
VALUES 
(1, 1)
;

SELECT users.id,
       users.first_name,
       users.last_name,
	   users.highscore,
       users.highscore_date
  FROM users
INNER JOIN game_users
	ON game_users.users_id = users.id
INNER JOIN game
	ON game.id = game_users.game_id
 WHERE url_slug = 'pac-man'
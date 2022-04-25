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

-- Create relation between game and user
INSERT INTO game_users (game_id, users_id)
VALUES 
(1, 1)
;
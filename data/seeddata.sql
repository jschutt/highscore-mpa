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
  username,
  highscore,
  highscore_date,
  game_id
) VALUES
(
  'Bruce Wayne',
  579680,
  '2001-05-24',
  1
);

INSERT INTO users (
  username,
  highscore,
  highscore_date,
  game_id
) VALUES
(
  'Clark Kent',
  1904060,
  '2004-02-04',
  2
);

    SELECT users.id,
           users.username,
	         users.highscore,
           users.highscore_date
      FROM users
INNER JOIN game
      	ON game.id = users.game_id
     WHERE url_slug = 'pac-man'

 -- Each users highest cores
    SELECT game.id,
	         game.title,
           game.image_url,
           game.url_slug,
		       users.username,
	     MAX (users.highscore)
	    FROM game
INNER JOIN users
        ON users.game_id = game.id
  GROUP BY game.id, users.username

-- Top highscore in each game
SELECT DISTINCT ON (game.title) 
                   game.title,
                   game.url_slug,
                   users.username,
                   users.highscore,
           TO_CHAR (users.highscore_date, 'DD-MM-YYYY') AS highscore_date
              FROM game
        INNER JOIN users
                ON users.game_id = game.id
          ORDER BY game.title, users.highscore DESC;
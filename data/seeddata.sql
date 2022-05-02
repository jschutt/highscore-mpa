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
  highscore_date
) VALUES
(
  'Bruce Wayne',
  579680,
  '2001-05-24'
);

INSERT INTO users (
  username,
  highscore,
  highscore_date
) VALUES
(
  'Clark Kent',
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

 -- Each users highest highscores
    SELECT game.id,
	         game.title,
           game.image_url,
           game.url_slug,
		       users.first_name,
           users.last_name,
	     MAX (users.highscore)
	    FROM game
INNER JOIN game_users
        ON game_users.game_id = game.id
INNER JOIN users
        ON users.id = game_users.users_id
  GROUP BY game.id, users.first_name, users.last_name


SELECT DISTINCT ON (game.title) 
				           game.title,
				           users.username,
				           users.highscore,
           TO_CHAR (users.highscore_date, 'DD-MM-YYYY') AS highscore_date
			        FROM game
		    INNER JOIN game_users
			        	ON game_users.game_id = game.id
		    INNER JOIN users
			        	ON users.id = game_users.users_id
		      ORDER BY game.title, users.highscore DESC;
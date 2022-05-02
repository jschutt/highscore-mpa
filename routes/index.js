var express = require("express");
var router = express.Router();

/* GET http://localhost:3000/ */
router.get("/", async function (req, res) {
  const db = req.app.locals.db;

  const sql = `
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
`;

  const result = await db.query(sql);

  res.render("index", {
    title: "Highscore",
    users: result.rows,
  });
});

module.exports = router;

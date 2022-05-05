var express = require("express");
var router = express.Router();

/* GET http://localhost:3000/admin/games */
router.get("/", async function (req, res) {

    const db = req.app.locals.db;

    const sql = `
        SELECT game.id,
               game.title,
               game.genre,
               game.description,
       TO_CHAR (game.release_date, 'DD-MM-YYYY') AS release_date,
               game.image_url,
               game.url_slug
          FROM game
    `;

    const result = await db.query(sql);

    const games = result.rows;

    res.render("admin/games/index", {
      title: "Administration",
      games
    });
  });

/* GET http://localhost:3000/admin/games/new */
router.get("/new", function (req, res) {

  res.render("admin/games/new", {
    title: "Administration"
 
  });
});

module.exports = router;

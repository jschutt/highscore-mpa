var express = require("express");
var router = express.Router();

/*GET http://localhost:3000/games/urlSlug */
router.get("/:urlSlug", async function (req, res, next) {

  const urlSlug = req.params.urlSlug;

  const db = req.app.locals.db;

  const sql = `
    SELECT id,
           first_name,
           last_name
      FROM users
  `;

  const result = await db.query(sql, [urlSlug]);

  res.render("index", {
    title: "Highscore",
    users: result.rows
  });
});

module.exports = router;

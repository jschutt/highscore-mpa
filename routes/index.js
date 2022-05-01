var express = require('express');
var router = express.Router();

/* GET http://localhost:3000/ */
router.get('/', async function(req, res) {

  const db = req.app.locals.db;

  const sql = `
    SELECT id,
           first_name,
           last_name
      FROM users
  `;

  const result = await db.query(sql)

  res.render('index', { 
    title: 'Highscore',
    users: result.rows
  });
});

module.exports = router;

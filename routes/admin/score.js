var express = require("express");
var router = express.Router();

/* GET http://localhost:3000/admin/score */
router.get("/", async function (req, res) {


  res.render("index", {
    title: "Administration"
  });
});

/* GET http://localhost:3000/admin/score/new */
router.get("/new", async function (req, res) {

  res.render("index", {
    title: "Administration"
  });
});
  

module.exports = router;

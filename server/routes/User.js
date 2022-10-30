import express from "express";
import db from "../config/db.js";
const router = express.Router();
import uniqid from "uniqid";
import bcrypt from "bcrypt";
import session from "express-session";
import bodyParser from "body-parser";
import cookieParser from "cookie-parser";
const saltRounds = 10;
router.post("/register", (req, res) => {
  const username = req.body.username;
  const password = req.body.password;
  const firstName = req.body.firstName;
  const lastName = req.body.lastName;
  const dob = req.body.dateOfBirth;
  const email = req.body.email;

  bcrypt.hash(password, saltRounds, (err, hash) => {
    if (err) {
      console.log(err);
    }
    db.query(
      "INSERT INTO users (id, username, password, date_of_birth, first_name, last_name, email_id, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
      [uniqid(), username, hash, dob, firstName, lastName, email, new Date()],
      (err, result) => {
        console.log(err);
        res.send(result);
      }
    );
  });
});

router.post("/login", (req, res) => {
  const username = req.body.username;
  const password = req.body.password;
  db.query(
    "SELECT * FROM users WHERE username = ?",
    [username],
    (err, result) => {
      if (err) {
        res.send({ err: err });
      } else {
        if (result.length > 0) {
          bcrypt.compare(password, result[0].password, (error, response) => {
            if (response) {
              //   const id = result[0].id;
              req.session.user = result;
              console.log("hi", req.session.user);
              res.json({ auth: true, result: result });
            } else {
              res.json({
                auth: false,
                message: "Wrong combination of username/password!",
              });
            }
          });
        } else {
          res.json({
            auth: false,
            message: "No such user is found!!",
          });
        }
      }
    }
  );
});

router.get("/login", (req, res) => {
  if (req.session.user) {
    res.send({ loggedIn: true, user: req.session.user });
  } else {
    res.send({ loggedIn: false });
  }
});

router.get("/:id", (req, res) => {
  const { id } = req.params;
  db.query("SELECT * FROM users WHERE id = ?", [id], (err, result) => {
    console.log("MAAKIHU", result);
    res.send(result[0]);
  });
});

export default router;

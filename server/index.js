import express from "express";
import db from "./config/db.js";
import userRoute from "./routes/User.js";
import cors from "cors";
import session from "express-session";
import bodyParser from "body-parser";
import cookieParser from "cookie-parser";
const app = express();
app.use(
  cors({
    origin: ["http://localhost:3000"],
    methods: ["GET", "POST", "DELETE"],
    credentials: true,
  })
);
app.use(express.json());
app.use(cookieParser());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(
  session({
    key: "user",
    secret: "abhinav",
    resave: false,
    saveUninitialized: false,
    cookie: {
      expires: 24 * 60 * 60 * 1000,
    },
  })
);

app.use("/user", userRoute);

app.post("/post", (req, res) => {
  // console.log(req.session.user);
  const user_id = req.session.user[0].id;
  const username = req.session.user[0].username;
  const post_content = req.body.post_content;
  const post_img = req.body.post_img;
  const created_at = req.body.created_at;

  db.query(
    "INSERT INTO posts (user_id, post_content, post_img, created_at, username) VALUES (?, ?, ?, ?, ?)",
    [user_id, post_content, post_img, created_at, username],
    (err, result) => {
      console.log(err);
    }
  );
  // db.query(
  //   "INSERT INTO likes (post_id, user_id, username) VALUES (?, ?, ?)",
  //   [user_id, post_content, post_img, created_at],
  //   (err, result) => {
  //     console.log(err);
  //   }
  // );
});

app.get("/posts/:id", (req, res) => {
  const { id } = req.params;
  db.query(
    "SELECT *, COALESCE(num_likes, 0) FROM  (SELECT posts.* FROM posts INNER JOIN followers ON (posts.user_id = followers.followee_id AND followers.follower_id = ?) UNION ALL SELECT * FROM posts WHERE user_id = ?) t2 LEFT JOIN (select post_id, count(*) as num_likes from likes group by post_id) t1  ON (t1.post_id = t2.id)",
    [id, id],
    (err, result) => {
      // console.log(result);
      res.send(result);
    }
  );
});

app.get("/delete/post/:id", (req, res) => {
  const { id } = req.params;
  db.query("DELETE FROM posts WHERE id = ?", [id], (err, result) => {
    if (err) console.log(err);
    res.send(result);
  });
});

app.post("/edit/post/:id", (req, res) => {
  const { id } = req.params;
  const content = req.body.post_content;
  db.query(
    "UPDATE posts SET post_content = ? WHERE id = ?",
    [content, id],
    (err, result) => {
      if (err) console.log(err);
      else console.log(result);
    }
  );
});

app.post("/follow", (req, res) => {
  const followerId = req.body.followerId;
  const followeeId = req.body.followeeId;
  db.query(
    "INSERT INTO followers (follower_id, followee_id) VALUES (?, ?)",
    [followerId, followeeId],
    (err, results) => {
      if (err) console.log(err);
      else console.log(results);
    }
  );
});

app.get("/followStatus/:followeeId/:followerId", (req, res) => {
  const { followeeId, followerId } = req.params;
  // console.log(followeeId, followeeId);
  db.query(
    "SELECT * FROM followers WHERE follower_id = ? AND followee_id = ?",
    [followerId, followeeId],
    (err, results) => {
      // console.log(results);
      if (results.length >= 1) {
        res.send({ followStatus: true });
      } else res.send({ followStatus: false });
    }
  );
});

app.post("/unfollow", (req, res) => {
  const followerId = req.body.followerId;
  const followeeId = req.body.followeeId;
  db.query(
    "DELETE FROM followers WHERE follower_id = ? AND followee_id = ?",
    [followerId, followeeId],
    (err, results) => {
      // if (err) console.log(err);
      // else console.log(results);
    }
  );
});

app.get("/logout", (req, res) => {
  res.redirect("/");
  req.session.destroy();

  // req.logout();
});

app.post("/post/comment", (req, res) => {
  const post_id = req.body.post_id;
  const comment_body = req.body.comment_body;
  const commented_by = req.body.commented_by.id;
  const commented_by_name = req.body.commented_by.username;
  db.query(
    "INSERT INTO comments (commented_by, comment_body, post_id, commented_by_name) VALUES (?, ?, ?, ?)",
    [commented_by, comment_body, post_id, commented_by_name],
    (err, results) => {
      if (err) console.log(err);
      // else console.log(results);
    }
  );
});

app.get("/comment/:postId", (req, res) => {
  const { postId } = req.params;
  let comments = [];
  db.query(
    "SELECT * FROM comments WHERE post_id = ?",
    [postId],
    (err, results) => {
      if (err) console.log(err);
      // else console.log(results);
      comments = results;
      res.send(comments);
    }
  );
});

app.get("/userData", (req, res) => {
  db.query("SELECT * FROM users", (err, results) => {
    res.send(results);
  });
});

app.get("/getFollowings/:id", (req, res) => {
  const { id: follower_id } = req.params;
  db.query(
    "SELECT followee_id, username FROM followers INNER JOIN users ON followers.followee_id = users.id AND followers.follower_id = ?",
    [follower_id],
    (err, results) => {
      if (err) console.log(err);
      else {
        res.send(results);
        console.log(results);
      }
    }
  );
});

app.post("/like", (req, res) => {
  const post_id = req.body.post_id;
  const user_id = req.body.user_id;
  const username = req.body.username;

  db.query(
    "INSERT INTO likes (post_id, user_id, username) VALUES (?, ?, ?)",
    [post_id, user_id, username],
    (err, results) => {
      if (err) console.log(err);
      else console.log(results);
    }
  );
});

app.get("/getLikes/:id", (req, res) => {
  const { id } = req.params;
  db.query(
    "SELECT post_id from likes WHERE user_id = ?",
    [id],
    (err, results) => {
      if (err) console.log(err);
      else res.send(results);
    }
  );
});

app.post("/unlike", (req, res) => {
  const { post_id, user_id } = req.body;
  db.query(
    "DELETE FROM likes WHERE post_id = ? AND user_id = ?",
    [post_id, user_id],
    (err, results) => {
      if (err) console.log(err);
      else console.log(results);
    }
  );
});

app.listen(3001, (req, res) => {
  console.log("Listening on port 3001!");
});

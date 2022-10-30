import Axios from "axios";
import React, { useState } from "react";
import { useEffect, useContext } from "react";
import { AppContext } from "../App";
import Comments from "./Comments";

function Comment(props) {
  const [comment, setComment] = useState("");
  const { loginStatus, user } = useContext(AppContext);
  const commentHandler = (e) => {
    setComment(e.target.value);
  };
  const saveComment = () => {
    Axios.post("http://localhost:3001/post/comment", {
      post_id: props.post_id,
      comment_body: comment,
      commented_by: user,
    })
      .then((response) => {
        console.log(response);
      })
      .catch((err) => {
        console.log(err);
      });

    setComment("");
  };
  return (
    <div className="mt-5">
      <div className="block w-full">
        <input
          className="w-full border-2 border-solid focus:outline-none rounded p-2"
          placeholder="Add Comment....."
          onChange={commentHandler}
          value={comment}
        ></input>
        <button
          onClick={saveComment}
          className="ml-auto bg-indigo-600 text-white fonr-[Poppins] py-2 px-6 rounded hover:bg-indigo-400 duration-500 mt-3 h-10"
        >
          Comment
        </button>
      </div>
      <h3>COMMENTS</h3>
      <Comments post_id={props.post_id}></Comments>
    </div>
  );
}

export default Comment;

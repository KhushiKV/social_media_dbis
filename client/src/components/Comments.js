import React, { useState, useContext } from "react";
import Axios from "axios";
import { AppContext } from "../App";

function Comments(props) {
  const [comments, setComments] = useState([]);
  const { loginStatus, user } = useContext(AppContext);
  Axios.get(`http://localhost:3001/comment/${props.post_id}`)
    .then((response) => {
      setComments(response.data);
    })
    .catch((err) => {
      console.log(err);
    }, []);

  return (
    <>
      {comments
        .slice(0)
        .reverse()
        .map((comment) => (
          <div className="border-2 border-dashed p-3 mb-2">
            <div key={comment.id}>{comment.comment_body}</div>
            <a href={`/user/${comment.commented_by}`}>
              <span className="text-xs italic">
                By {comment.commented_by_name}
              </span>
            </a>
            <br></br>
            {user.username === comment.commented_by_name && (
              <>
                <button className="text-xs bg-red-800 p-1 text-white mr-2 rounded">
                  Delete
                </button>
                <button className="text-xs bg-green-800 p-1 text-white mr-2 rounded">
                  Edit
                </button>
              </>
            )}
          </div>
        ))}
    </>
  );
}

export default Comments;

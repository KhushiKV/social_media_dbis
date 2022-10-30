import * as React from "react";
import TextareaAutosize from "@mui/material/TextareaAutosize";
import { height } from "@mui/system";
import { useState } from "react";
import Axios from "axios";
import Button from "./Button";
import uuid from "react-uuid";

export default function InputPost() {
  Axios.defaults.withCredentials = true;
  const [image, setImage] = useState("");
  const [post, setPost] = useState("");
  const [imageUrl, setImageUrl] = useState("");
  const postHandler = (e) => {
    setPost(e.target.value);
  };
  const imageHandler = (e) => {
    setImage(e.target.files[0]);
  };
  let imgUrl = "";

  const uploadImage = async (image) => {
    const formData = new FormData();
    console.log(image);
    formData.append("file", image);
    formData.append("upload_preset", "g330on9r");
    formData.append("cloud_name", "abhi9av");
    // formData.append("public_id", uniq);

    await fetch("https://api.cloudinary.com/v1_1/abhi9av/image/upload", {
      method: "post",
      body: formData,
    })
      .then((response) => response.json())
      .then(async (data) => {
        // imgUrl = data.secure_url;
        // return data.secure_url;

        imgUrl = data.secure_url;
        setImageUrl(imgUrl);
        // console.log(imageUrl);
        console.log(data.secure_url);
      })
      .catch((err) => {
        console.log(err);
      });
  };
  const savePost = async () => {
    if (image !== "") {
      await uploadImage(image);
    }
    console.log(imageUrl);
    console.log(imgUrl);
    await Axios.post("http://localhost:3001/post", {
      post_content: post,
      post_img: imgUrl,
      created_at: String(new Date()),
    })
      .then((response) => {
        console.log(response);
      })
      .catch((err) => {
        console.log(err);
      });
  };

  return (
    <>
      <div className="relative text-center justify-center mt-10 -z-0">
        <h1 className="text-4xl mb-4">CREATE A POST</h1>
        <TextareaAutosize
          maxRows={10}
          aria-label="maximum height"
          placeholder="Maximum 10 rows"
          defaultValue=""
          style={{ width: 1000, height: 200 }}
          onChange={postHandler}
          className="border-solid border-2 focus:outline-none p-3 rounded-xl"
        />
        <div className="justify-center text-center ml-auto">
          <input
            type="file"
            className="inline text-sm text-slate-500
       file:py-2 file:px-4
      file:rounded-full file:border-0
      file:text-sm file:font-semibold
      file:bg-violet-50 file:text-violet-700
      hover:file:bg-violet-100 justify-center
      
    "
            onChange={imageHandler}
          />
          <button
            className="bg-indigo-600 text-white fonr-[Poppins] py-2 px-6 rounded md:ml-8 hover:bg-indigo-400 duration-500 md:mr-0 mr-7"
            onClick={savePost}
          >
            POST
          </button>
        </div>
      </div>
    </>
  );
}

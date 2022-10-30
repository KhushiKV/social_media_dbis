import React, { useEffect, useContext } from "react";
import { AppContext } from "../App";
import InputPost from "../components/InputPost";
import Posts from "../components/Posts";
import { useNavigate } from "react-router-dom";
import Axios from "axios";

function Home() {
  Axios.defaults.withCredentials = true;
  const { loginStatus, user, setLoginStatus } = useContext(AppContext);
  const navigate = useNavigate();
  let login = false;
  useEffect(() => {
    Axios.get("http://localhost:3001/user/login").then((response) => {
      if (response.data.loggedIn === true) {
        setLoginStatus(true);
      } else {
        setLoginStatus(false);
        navigate("/login");
      }
    });
  });
  return (
    <>
      <InputPost className="z-0"></InputPost>
      <Posts></Posts>
    </>
  );
}

export default Home;

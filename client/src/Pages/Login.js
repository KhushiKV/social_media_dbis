import React, { useState, useEffect, useContext } from "react";
import { AppContext } from "../App";
import TextField from "@mui/material/TextField";
import Stack from "@mui/material/Stack";
import Button from "@mui/material/Button";
import Axios from "axios";
import { useNavigate } from "react-router-dom";
import "./Login.css";

function Login() {
  const navigate = useNavigate();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const { loginStatus, setLoginStatus } = useContext(AppContext);
  Axios.defaults.withCredentials = true;
  const usernameHandler = (e) => {
    setUsername(e.target.value);
  };
  const passwordHandler = (e) => {
    setPassword(e.target.value);
  };
  const login = () => {
    Axios.post("http://localhost:3001/user/login", {
      username: username,
      password: password,
    })
      .then((response) => {
        if (!response.data.auth) {
          setLoginStatus(false);
        } else {
          console.log(response.data);
          setLoginStatus(true);
        }
        console.log(response);
      })
      .catch((err) => {
        console.log(err);
      });

    setLoginStatus(true);
    navigate("/");
    navigate("/");
  };

  if (loginStatus) navigate("/");

  return (
    <div className="h-screen w-screen flex justify-center items-center">
      <div className="login h-96 w-80 align-content-center bg-zinc-300 p-10 bg-opacity-25 rounded-md">
        <h1 className="text-5xl mb-8">Login</h1>
        <Stack spacing={3}>
          <TextField
            className="input-fields"
            label="Username"
            variant="standard"
            type="text"
            onChange={usernameHandler}
            value={username}
          />
          <TextField
            className="input-fields"
            label="Password"
            variant="standard"
            type="password"
            onChange={passwordHandler}
            value={password}
          />
          <Button variant="contained" size="large" onClick={login}>
            Login
          </Button>
        </Stack>
      </div>
    </div>
  );
}

export default Login;

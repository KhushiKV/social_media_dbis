import React, { useState, useContext } from "react";
import Stack from "@mui/material/Stack";
import Button from "@mui/material/Button";
import TextField from "@mui/material/TextField";
import { DesktopDatePicker } from "@mui/x-date-pickers/DesktopDatePicker";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import Container from "@mui/material/Container";
import dayjs from "dayjs";
import Axios from "axios";
import { AppContext } from "../App";

function Register() {
  const [usernameReg, setUsernameReg] = useState("");
  const [passwordReg, setPasswordReg] = useState("");
  const [firstNameReg, setFirstNameReg] = useState("");
  const [lastNameReg, setLastNameReg] = useState("");
  const [emailReg, setEmailReg] = useState("");
  const [value, setValue] = React.useState(dayjs("2014-08-18T21:11:54"));
  const { loginStatus, setLoginStatus, setUser, user } = useContext(AppContext);
  //   const { setCurrUser } = useContext(LoginContext);
  //   const { setLoginStatus } = useContext(LoginContext);

  const handleChange = (newValue) => {
    setValue(newValue);
  };

  const usernameRegHandler = (e) => {
    setUsernameReg(e.target.value);
  };
  const passwordRegHandler = (e) => {
    setPasswordReg(e.target.value);
  };
  const firstNameRegHandler = (e) => {
    setFirstNameReg(e.target.value);
  };
  const lastNameRegHandler = (e) => {
    setLastNameReg(e.target.value);
  };
  const emailRegHandler = (e) => {
    setEmailReg(e.target.value);
  };
  const register = () => {
    Axios.post("http://localhost:3001/user/register", {
      firstName: firstNameReg,
      lastName: lastNameReg,
      username: usernameReg,
      password: passwordReg,
      dateOfBirth: value,
      email: emailReg,
    })
      .then((response) => {
        console.log(response);
      })
      .catch((err) => {
        console.log(err);
      });

    setUsernameReg("");
    setPasswordReg("");
    setFirstNameReg("");
    setLastNameReg("");
    setEmailReg("");
  };
  return (
    <div className="h-screen w-screen flex justify-center items-center">
      <div className="registration h-100 w-98 align-content-center bg-zinc-300 p-10 bg-opacity-25 rounded-md">
        <h1 className="text-5xl mb-8">Registration</h1>
        <Stack spacing={3} className="stack-div">
          <TextField
            className="input-fields"
            label="First Name"
            variant="standard"
            type="text"
            onChange={firstNameRegHandler}
            value={firstNameReg}
          />
          <TextField
            className="input-fields"
            label="Last Name"
            variant="standard"
            type="text"
            onChange={lastNameRegHandler}
            value={lastNameReg}
          />
          <TextField
            className="input-fields"
            label="Username"
            variant="standard"
            type="text"
            onChange={usernameRegHandler}
            value={usernameReg}
          />
          <TextField
            className="input-fields"
            label="Email"
            variant="standard"
            type="text"
            onChange={emailRegHandler}
            value={emailReg}
          />
          <LocalizationProvider dateAdapter={AdapterDayjs}>
            <DesktopDatePicker
              label="Date desktop"
              inputFormat="MM/DD/YYYY"
              value={value}
              onChange={handleChange}
              renderInput={(params) => <TextField {...params} />}
            />
          </LocalizationProvider>
          <TextField
            className="input-fields"
            label="Password"
            variant="standard"
            type="password"
            onChange={passwordRegHandler}
            value={passwordReg}
          />
          <Button variant="contained" size="large" onClick={register}>
            Register
          </Button>
        </Stack>
      </div>
    </div>
  );
}

export default Register;

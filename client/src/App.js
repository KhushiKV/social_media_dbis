import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Home from "./Pages/Home";
import Navmenu from "./components/Navmenu";
import Register from "./Pages/Register";
import Login from "./Pages/Login";
import Profile from "./Pages/Profile";
import { createContext, useState, useMemo, useEffect } from "react";
import Axios from "axios";
import SearchBar from "./components/SearchBar";
import "./App.css";

export const AppContext = createContext();

function App() {
  Axios.defaults.withCredentials = true;
  const [loginStatus, setLoginStatus] = useState(false);
  const [user, setUser] = useState({});

  useEffect(() => {
    Axios.get("http://localhost:3001/user/login").then((response) => {
      if (response.data.loggedIn === true) {
        setLoginStatus(true);
        setUser({
          username: response.data.user[0].username,
          id: response.data.user[0].id,
        });
      } else {
        setLoginStatus(false);
      }
    });
  });

  return (
    <AppContext.Provider value={{ loginStatus, setLoginStatus, user, setUser }}>
      <Navmenu></Navmenu>
      <Router>
        <Routes>
          <Route path="/" exact element={<Home></Home>}></Route>
          <Route path="/login" exact element={<Login></Login>}></Route>
          <Route path="/register" exact element={<Register></Register>}></Route>
          <Route path="/user/:id" exact element={<Profile></Profile>}></Route>
        </Routes>
      </Router>
    </AppContext.Provider>
  );
}

export default App;

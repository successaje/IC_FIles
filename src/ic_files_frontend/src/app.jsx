import React from "react";
// import Header from "./components/header";
import { ReactDOM } from "react-dom/client";
import MyHello from "./index";

import ".assets";

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <>
        <MyHello />
    </>
);

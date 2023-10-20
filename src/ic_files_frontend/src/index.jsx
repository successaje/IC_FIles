import { ic_files_backend } from "../../declarations/ic_files_backend";
import * as React from "react";
import { render } from "react-dom"
import Header from "./components/header";
import Sidebar from "./components/Sidebar";

import "../assets/main.css";
// import 

const MyHello = () => {
  const [name, setName] = React.useState('');
  const [message, setMessage] = React.useState('');
  const [userName, setUserName] = React.useState('');
  const [email, setEmail] = React.useState('');


  async function doGreet() {
    const greeting = await ic_files_backend.greet(name);
    setMessage(greeting);
  }

  async function doCreateProfile() {
    let name = document.getElementById("newEntryName").value;
    let userName = document.getElementById("newEntryUserName").value;
    let email = document.getElementById("newEntryEmail").value;
    const profile = await ic_files_backend.Init_Profile(userName, name, email)
    console.log(profile);
  }

return (
  <>
    <Header />
    <div className="App">
      <Sidebar />
    </div>
  </>
  
  // <div className="App">
  //   <SideBar />
  // </div>
);


// <div style={{ "fontSize": "30px" }}>
//   <Header />
//   {/* Header */}
//   {/*auth == true
//       sidebar
//       filesView
//       sideicons
//    */}

    
//       {/* <SideBar /> */}
//       <p>Greetings, from ICFiles!</p>
//       <p>
//         {" "}
//         Type your message in the Name input field, then click{" "}
//         <b> Get Greeting</b> to display the result.
//       </p>
//     <div style={{ margin: "30px" }}>
//       <input
//         id="name"
//         value={name}
//         onChange={(ev) => setName(ev.target.value)}
//       ></input>
//       {/* <input
//         id= */}
//       <button onClick={doGreet}>Get Greeting!</button>
//     </div>

//     <div>
//       Greeting is: "
//       <span style={{ color: "blue" }}>{message}</span>"
//     </div>
//   </div>



// document.querySelector("form").addEventListener("submit", async (e) => {
//   e.preventDefault();
//   const button = e.target.querySelector("button");

//   const name = document.getElementById("name").value.toString();

//   button.setAttribute("disabled", true);

//   // Interact with foo actor, calling the greet method
//   const greeting = await ic_files_backend.greet(name);

//   button.removeAttribute("disabled");

//   document.getElementById("greeting").innerText = greeting;

//   return false;
};

render(<MyHello />, document.getElementById("app"))

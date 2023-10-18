import React from "react";
import styled from "styled-components";

const SideBar = () => {
  return (
    <Container>
      <Logo>
        <img src={`logo.png`} alt="IC FIles" />
        <p>ICfile</p>
      </Logo>
      <Navigation>
        <a href="#">Storage</a>
        <a href="#">Starred</a>
        <a href="#">Shared</a>
        <a href="#">Space</a>
        <a href="#">Recycle bin</a>
      </Navigation>
      <Footer>
        <a href='#'>Help & support</a>
        <a href='#'>Log out</a>
      </Footer>
    </Container>
  );
};

export default SideBar;

// const Container = styled.div`
//    display: flex
//    position: fixed
//    background-color: #fff;
// `;

const Logo = styled.div`
  display: flex;
  align-items: center;
  img {
    width: 40px;
  }
  span {
    font-size: 22px;
    margin-left: 10px;
    color: gray;
  }
`;

const Container = styled.div`
  width: 250px;
  background-color: #333;
  color: #fff;
  padding: 20px;
  display: flex;
  position: fixed;
  flex-direction: column;
  justify-content: space-between;
  height: 100vh;
`;

const Navigation = styled.div`
  display: flex;
  flex-direction: column;
  margin-top: 120px;

  a {
    color: #70560d;
    text-decoration: none;
    margin: 20px 0;
    font-size: 20px;
  }
`;

const Footer = styled.div`
  margin-top: auto;
  margin-bottom: 15rem;
  text-align: center;
  display: flex;
  flex-direction: column;

  a {
    color: #70560d;
    text-decoration: none;
    margin: 10px 0; 
    font-size: 20px;
  }
`;

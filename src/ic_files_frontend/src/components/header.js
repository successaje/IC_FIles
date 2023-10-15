import styled from "styled-components"
import React from "react";
import logo from "../../assets/iclogo.png"
const HeaderContainer = styled.div`
    display : grid;
    grid-template-columns : 300px auto 200px;
    align-items: clearInterval;
    padding: 5px 20px;
    height : 60px;
    border-bottom : 1px solid lightgray;
`;

const HeaderLogo = styled.div`
    display : flex;
    align-items: center;
    img {
        width : 40px;
    }
    span {
        font-size : 22px;
        margin-left: 10px;
        color : gray;
    }
`;

const HeaderSearch = styled.div`
    display : flex;
    align-items : center;
    width : 700px;
    background-color : whitesmoke;
    padding : 12px
`

const Header = () => {
    return (
        <div className="header">
            <div className="header__logo"></div>
                <img src={logo} alt=""/>
                <span>ICFiles</span>
            <div className="header_searchContainer"></div>
            <div className="header__icon"></div>    
            Header
        </div>
    )
}

export default Header
import styled from "styled-components"
import React from "react";
import {FiSearch} from "react-icons/fi";
import {FiAlignCenter} from "react-icons/fi";
import {FiSettings} from "react-icons/fi";
import {MdLiveHelp} from "react-icons/md";
import {RxAvatar} from "react-icons/rx";


// import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
// import SearchIcon from '@mui/icons-material/Search';

// Flex-box -- checked
// Positions fix
//  Margin left    --- to avoid overlaying





const Header = () => {
    return (
        
        
            <HeaderContainer>
                <HeaderLogo>
                <img src={`logo.png`} alt=""/>
                <span>ICFiles</span>
                </HeaderLogo>
                <HeaderSearch>
                    <FiSearch />
                    <input type="text"  placeholder="search"/>
                    <FiAlignCenter />
                </HeaderSearch>
                <HeaderIcons>
                    <span>
                        <MdLiveHelp />
                        <FiSettings />
                    </span>
                    <span>
                        <RxAvatar />
                    </span>
                </HeaderIcons>
            </HeaderContainer>
                
               
     
    )
}

export default Header;

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
    border-radius : 10px;
    input {
        background-color : transparent;
        border : 0;
        outline : 0;
        flex : 1;
    }
    `;

const HeaderIcons = styled.div`
    display : flex;
    align-items : center;
    span {
        display : flex;
        align-items : center;
        margin-left : 20px;
    }
    svg.MuiIcon-rot{
        margin 0px 10px;
    } 
`;

  const SearchIcon =  styled(FiSearch)`

  `  
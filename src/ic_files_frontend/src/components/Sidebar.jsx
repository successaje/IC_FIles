import {MdMobileScreenShare} from "react-icons/md";
import {MdOutlinePeopleAlt} from "react-icons/md";
import {MdOutlineQueryBuilder} from "react-icons/md";
import {MdStarBorder} from "react-icons/md";
import {MdOutlineDeleteOutline} from "react-icons/md";
import {MdOutlineCloudQueue} from "react-icons/md";
import {MdDevices} from "react-icons/md";

import styled from "styled-components";
import { Modal } from '@material-ui/core';
import { React } from 'react';

const Sidebar = () => {

    return (
        
            <SidebarContainer>
                <SidebarBtn>
                    <img src={`add.png`} alt=""/>
                    <span>
                        Add File
                    </span>
                </SidebarBtn>
                <SidebarOptions>
                    <SidebarOption>
                        <MdMobileScreenShare />
                        <span> My Files</span>
                    </SidebarOption>
                    <SidebarOption>
                        <MdDevices>
                            <MdDevices />
                            <span>Computers</span>
                        </MdDevices>
                    </SidebarOption>
                    <SidebarOption>
                        <MdDevices>
                            <MdOutlineQueryBuilder />
                            <span>Recent</span>
                        </MdDevices>
                    </SidebarOption>
                    <SidebarOption>
                        <MdDevices>
                            <MdStarBorder />
                            <span>Starred</span>
                        </MdDevices>
                    </SidebarOption>
                    <SidebarOption>
                        <MdDevices>
                            <MdOutlineDeleteOutline />
                            <span>Bin</span>
                        </MdDevices>
                    </SidebarOption>
                </SidebarOptions>
                <hr />
                <SidebarOptions>
                    <SidebarOption>
                        <MdOutlineCloudQueue />
                        <span>Storage</span>
                    </SidebarOption>
                    <div className="progress_bar">
                        <progress size="tiny" value="50" max="100" />
                        <span>10 GB of 200GB used</span>
                    </div>
                </SidebarOptions>
            </SidebarContainer>
        
    )
}

export default Sidebar;

const SidebarContainer = styled.div`
    margin-top: 10px;
`;
const SidebarBtn = styled.div`
    button {
        background: transparent;
        border: 1px solid lightgray;
        display: flex;
        align-items: center;
        border-radius: 40px;
        padding:5px 10px;
        box-shadow:2px 2px 2px #ccc;
        margin-left: 20px;
        span {
            font-size: 16px;
            margin-right: 20px;
            margin-left: 10px;
        }
    }
`;

const SidebarOptions = styled.div`
    margin-top: 10px;
    .progress_bar {
        padding: 0px 20px;
    }
    .progress_bar span {
        display: block;
        color:#333;
        font-size: 13px;
    }
`;


const SidebarOption = styled.div`
    display: flex;
    align-items: center;
    padding: 8px 20px;
    border-radius: 0px 20px 20px 0px;
    &:hover{
        background: whitesmoke;
        cursor: pointer;
    }
    svg.MuiSvgIcon-root {
        color:rgb(78, 78, 78);
    }
    span {
        margin-left: 15px;
        font-size: 13px;
        font-weight: 500;
        color:rgb(78, 78, 78)
    }
`;

const ModalPopup = styled.div`
    top: 50%;
    background-color: #fff;
    width: 500px;
    margin: 0px auto;
    position: relative;
    transform: translateY(-50%);
    padding: 10px;
    border-radius: 10px;
`;

const ModalHeading = styled.div`
    text-align: center;
    border-bottom: 1px solid lightgray;
    height: 40px;
`;

const ModalBody = styled.div`
    input.modal__submit {
        width: 100%;
        background: darkmagenta;
        padding: 10px 20px;
        color: #fff;
        text-transform: uppercase;
        letter-spacing: 5px;
        font-size: 16px;
        border: 0;
        outline: 0;
        border-radius: 5px;
        cursor: pointer;
        margin-top:20px
    }
    input.modal__file {
        background: whitesmoke;
        padding: 20px;
        color: #000;
        display: block;
        margin-top:20px
    }
`


const UploadingPara = styled.p`
    background: green;
    color: #fff;
    margin: 20px;
    text-align: center;
    padding: 10px;
    letter-spacing: 1px;
`


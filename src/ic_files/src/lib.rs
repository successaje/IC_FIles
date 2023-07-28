use ic_cdk_macros::*;
use ic_cdk::api::{caller as _caller};
use ic_cdk::export::candid::{candid_method, CandidType, Deserialize, Int, Nat};
use ic_cdk::storage;
use ic_cdk::export::Principal;
use serde::{Deserialize, Serialize};


#[import(canister = "ic_files_backend")]

use std::collections::{HashMap, HashSet};
use std::cell::RefCell;

use types::*;

struct CounterCanister;

[#update]
async fn read() -> candid::Nat {
    CounterCanister::read().await.0
}

mod types {

    use super::*;

    #[derive(CandidType, Deserialize)]
    pub struct InitProfile {
        pub name : Option<String>,
        pub identity : Option<Principal>,
        pub username : Option<String>,
        pub email : Option<String>,
        pub created_at : Option<u64>,
        pub access_priviledges : Vec<String>
    }

    #[derive(CandidType, Default, Deserialize)]
    pub struct InitFile = {
        pub name : Option<String>,
        pub owner : Principal,
        pub user : Option<String>,
        pub filesize : Nat, // in MB
        pub filetype : Option<String>,
        pub folder : Option<String>,
        pub edited : bool,
        pub editable : bool,
        pub sharedwith : Vec<User>,
        pub encrypted : bool,
        pub accessible : AccessType,
    };

    #[derive(CandidType, Default、Deserialize)]
    pub struct FileMeta = {
        pub id : String,
        pub user : User,
        pub name : String,
        pub shared_with : Vec<User>,
        pub file_size : Nat,
        pub created_at : Int,
        pub file_hash : String,
    }

    pub type User = String;

    #[derive(CandidType)]
    pub enum AccessType {
        ReadOnly,
        ReadWrite,
    };

    #[derive(CandidType, Default, Deserialize)]
    pub struct AccessPriviledge = {
        pub file_id : String,
        pub access_type : AccessType,
        pub expiration_date : Int,
    }

    #[derive(CandidType, Default, Deserialize)]
    pub struct InitEncryption = {
        pub key : String,
        algo : String,
        blob_metadata : Vec<u8>
    }


}

fn caller() -> Principal {
    let caller = _caller();
    if caller == Principal::anonymous() {
        panic!("Anonymous principal not allowed to make calls.")
    }
    caller
}


#[init]
fn init() {}



#[update(name = "whoami")]
fn whoami() -> String {
    caller
}

mod user {
    use super::*;




}


#[ic_cdk::query]
fn greet(name: String) -> String {
    format!("Hello, {}!", name)
}

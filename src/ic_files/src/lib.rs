use ic_cdk_macros::*;
use ic_cdk::export::candid::{candid_method, CandidType, Deserialize, Int, Nat};
use ic_cdk::export::Principal;
#[import(canister = "ic_files_backend")]

use std::collections::{HashMap, HashSet};

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
        pub created_at : Option<i64>,
        pub access_priviledges : Option<[String]>
    }

    #[derive(CandidType, Default, Deserialize)]
    pub struct InitFile = {
        pub name : Option<String>;
        pub owner : Principal;
        pub user : Option<String>;
        pub filesize : Nat; // in MB
        pub filetype : Option<String>;
        pub folder : Option<String>;
        pub edited : bool;
        pub editable : bool;
        pub sharedwith : [User];
        pub encrypted : bool;
        pub accessible : AccessType;
    };

    pub type User = String;

    #[derive(CandidType)]
    pub enum AccessType {
        ReadOnly,
        ReadWrite,
    };
}


#[ic_cdk::query]
fn greet(name: String) -> String {
    format!("Hello, {}!", name)
}

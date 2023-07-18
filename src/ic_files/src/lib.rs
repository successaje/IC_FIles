use ic_cdk_macros::*;
use ic_cdk::export::candid;
#[import(canister = "ic_files_backend")]

// struct CounterCanister;

// [#update]
// async fn read() -> candid::Nat {
//     CounterCanister::read().await.0
// }

#[ic_cdk::query]
fn greet(name: String) -> String {
    format!("Hello, {}!", name)
}

import Types "types";

import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Time "mo:base/Time";

module {

    public class User(state : Types.State) {

        var Profile__backup__ : [(Principal, Types.Profile__init__)] = [];
        var Profile__hash__ : HashMap.HashMap<Principal, Types.Profile__init__> = HashMap.fromIter<Principal, Types.Profile__init__>(Profile__backup__.vals(), 10, Principal.equal, Principal.hash);

        public func logIn(caller : Principal) : Bool {
            var state = Profile__hash__.get(caller);
            switch (state) {
                case null {
                    return false;
                };
                case (?(_)) {
                    return true;
                };
            };

        };

        private func Verifier(userName : Text, email : Text) : Bool {
            var unique = true;
            for ((i, j) in Profile__hash__.entries()) {
                if (j.userName == username and j.email == email) {
                    unique := false;
                };
            };
            unique;
        };


        public func __init__(caller : Principal, userName : Text, name : Text, email : Text) : Result.Result<Text, Text> {
            if (Verifier(userName, email) == false){
                #err("This username or email exists!")
            } else {
                Profile__hash__.put(caller , {
                    caller;
                    userName;
                    name;
                    email;
                    Time.now();
                    [];
                });
                #ok("You have created an account successfully");
            }
           
        }
    };
};

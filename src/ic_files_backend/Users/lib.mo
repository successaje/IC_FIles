import Types "types";

import HashMap "mo:base/HashMap";
import Int "mo:base/Int";
import Iter "mo:base/Iter";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import Result "mo:base/Result";
import Time "mo:base/Time";

module {

    public class User(state : Types.State) {

        type User = Types.Profile__init__;

        var Profile__backup__ : [(Principal, Types.Profile__init__)] = [];
        var Profile__hash__ : HashMap.HashMap<Principal, Types.Profile__init__> = HashMap.fromIter<Principal, Types.Profile__init__>(Profile__backup__.vals(), 10, Principal.equal, Principal.hash);

        public func toStable() : Types.LocalStableState{
            Profile__backup__ := Iter.toArray(Profile__hash__.entries());
            return {
                Profile__backup__;
            }
        };

        public func postStable(_profileEntries : [(Principal, Types.Profile__init__)]) {
            Profile__hash__ := HashMap.fromIter<Principal, Types.Profile__init__>(Profile__backup__.vals(), 10, Principal.equal, Principal.hash);    
        };

        public func _restore(backup : Types.LocalStableState) : () {
            Profile__backup__          := backup.Profile__backup__;
        };

        // _restore(state);

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
                if (j.userName == userName and j.email == email) {
                    unique := false;
                };
            };
            unique;
        };

        private func Verifier_(userName : Text) : Bool {
            var unique = true;
            for ((i, j) in Profile__hash__.entries()) {
                if (j.userName == userName) {
                    unique := false;
                };
            };
            unique;
        };

        private func Verifier__(email : Text) : Bool {
            var unique = true;
            for ((i, j) in Profile__hash__.entries()) {
                if (j.email == email) {
                    unique := false;
                };
            };
            unique;
        };



        public func __brew__(identity : Principal, userName : Text, name : Text, email : Text, createdAt : Int, access_priviledges : [Text], updated : Bool) : Types.Profile__init__ {
            {
                identity;
                userName;
                name;
                email;
                createdAt;
                access_priviledges;
                updated;
            };
        };

        public func __init__(caller : Principal, userName : Text, name : Text, email : Text) : Result.Result<Text, Text> {
            if (Verifier(userName, email) == false){
                #err("This username or email exists!")
            } else {
                var time : Int = Time.now();
                Profile__hash__.put(caller , __brew__(caller, userName, name, email, Time.now(), [], false));
                #ok("You have created an account successfully");
            }
        };

        public func GetUser(caller : Principal) : ?User{
            Profile__hash__.get(caller);
        };

        // public func Replace(profile : User, caller : Principal){
        //     Profile__hash__.replace(caller, profile);
        // };

        public func updateProfile__userName(caller : Principal, username : Text) : Result.Result<Text, Text>{
            if (Verifier_(username) == false){
                #err("This username or email exists!")
            } else {
                var profile = GetUser(caller);
                switch(profile) {
                    case(null) { #ok("") };
                    case(?profile) { 
                        var updatedProfile = {
                            identity = profile.identity;
                            userName = username;
                            name = profile.name;
                            email = profile.email;
                            createdAt = profile.createdAt;
                            access_priviledges = profile.access_priviledges;
                            updated = true;
                        };
                        let updated = Profile__hash__.replace(caller, updatedProfile);
                        return #ok("successfully changed your username");
                    };
                };
            }
        };


        public func updateProfile__email(caller : Principal, _email : Text) : Result.Result<Text, Text>{
            if (Verifier__(_email) == false){
                #err("This username or email exists!")
            } else {
                var profile = GetUser(caller);
                switch(profile) {
                    case(null) { #ok("") };
                    case(?profile) { 
                        var updatedProfile = {
                            identity = profile.identity;
                            userName = profile.userName;
                            name = profile.name;
                            email = _email;
                            createdAt = profile.createdAt;
                            access_priviledges = profile.access_priviledges;
                            updated = true;
                        };
                        let updated = Profile__hash__.replace(caller, updatedProfile);
                        return #ok("You have successfully changed your email");
                    };
                };
            }
        };





    };
};

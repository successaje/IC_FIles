import Principal "mo:base/Principal";
import Result "mo:base/Result";

import Users "Users";
import UsersTypes "Users/types"

shared (msg) actor class icfiles (){
  
  public query func whoami() : async Principal {
    msg.caller;
  };

  let _Users = Users.User({

  });

  public shared ({caller}) func logIn() : async Bool {
    _Users.logIn(caller);
  };

  public shared ({caller}) func  Init_Profile(userName : Text, name : Text, email : Text) : async Result.Result<Text, Text>{
    _Users.__init__(caller, userName, name, email);
  };

  // public func 

};

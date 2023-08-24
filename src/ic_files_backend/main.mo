import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Hash "mo:base/Hash";
import Users "Users";
import UsersTypes "Users/types"

shared (msg) actor class icfiles (){
  
  public query func whoami() : async Principal {
    msg.caller;
  };

  private stable var Stabled__Profile : [(Principal, UsersTypes.Profile__init__)] = [];

  let _Users = Users.User({
    Profile__backup__ = Stabled__Profile;
  });

  public shared ({caller}) func logIn() : async Bool {
    _Users.logIn(caller);
  };

  public shared ({caller}) func  Init_Profile(userName : Text, name : Text, email : Text) : async Result.Result<Text, Text>{
    _Users.__init__(caller, userName, name, email);
  };

  public shared ({caller}) func Update_Username(userName : Text) : async Result.Result<Text, Text>{
    _Users.updateProfile__userName(caller, userName);
  };

  public shared ({caller}) func Update_Email(email : Text) : async Result.Result<Text, Text>{
    _Users.updateProfile__email(caller, email);
  };

  public shared ({caller}) func Fetch_All_Users() : async [(Principal, UsersTypes.Profile__init__)] {
    _Users.fetchAllUsers();
  };

  // public func 

  system func preupgrade(){

    let { Profile__backup__ } = _Users.toStable();
    Stabled__Profile := Profile__backup__;

  };

};

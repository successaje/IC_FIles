import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Hash "mo:base/Hash";
import Users "Users";
import UsersTypes "Users/types";
import Files "Files";
import FilesTypes "Files/types";

shared ({caller}) actor class icfiles () = this {

  let nexiCanister = actor("aol7b-vqaaa-aaaak-aepsq-cai") : actor {
    CheckPrincipal : shared () -> async Principal;
    createCompany : shared (Text, Text) -> async Bool;
    createQCard : shared (Text, Text) -> async ();
    greet : shared Text -> async Text;
  };
  


  // public query func whoami() : async Principal {
  //   install.caller;
  // };

  public shared ({caller}) func Test(a : Text, b : Text) : async Bool {
    await nexiCanister.createCompany(a, b);
  };

  public shared ({caller}) func Test1(name : Text) : async Text {
    await nexiCanister.greet(name);
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

  public func greet(name : Text) : async Text{
    return "How are you, " # name;
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

  let _Files  = Files.files({
    _Users;
    caller;
  });

  public shared ({caller}) func  Upload_File(file : FilesTypes.InitFile) : async Text {
    await _Files.Upload_File(caller, file);
  };

  public shared ({caller}) func GetMyFiles() : async [FilesTypes.InitFile] {
    await _Files.getAllfiles(caller);
  };

  public shared ({caller}) func deleteFile(id : Nat, name : Text) :  async () {
    _Files.deleteFile(caller, id, name);
  };

  // public func 

  // let file = Files.files({
  //   _Users;
  //   identity;
  // });

  system func preupgrade(){

    let { Profile__backup__ } = _Users.toStable();
    Stabled__Profile := Profile__backup__;

  };

};

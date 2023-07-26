import Int "mo:base/Int";
module {

    public type State = {
         Profile__backup__ : [(Principal, Profile__init__)];
    };

    public type LocalStableState = {
        Profile__backup__ : [(Principal, Profile__init__)];
    };



    public type Profile__init__ = {
        identity : Principal;
        userName : Text;
        name    : Text;
        email   : Text;
        createdAt : Int;
        access_priviledges : [Text];
        updated : Bool;
    };

//     module {

//     public type __init__ = {
//         username : Text;
//         password : Text;
//         email : Text;
//         
//     };
    
// }
}
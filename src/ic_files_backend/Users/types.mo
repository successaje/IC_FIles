import Int "mo:base/Int";
module {

    public type State = {
        
    };

    public type Profile__init__ = {
        identity : Principal;
        userName : Text;
        name    : Text;
        email   : Text;
        createdAt : Int;
        access_priviledges : [Text];
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
import Users "../Users";
module{

    public type State = {
        caller : Principal;
        _Users : Users.User;
    };

    public type LocalStableState = {
        File__Init__Backup : [()];
    };

    public type User = Text;

    public type InitFile = {
        id  : Nat;
        name : Text;
        owner : Principal;
        user : Text;
        fileSize : Nat; // in MB
        fileType : Text;
        folder : Text;
        edited : Bool;
        editable : Bool;
        sharedWith : [User];
        encrypted : Bool;
        accessible : AccessType;
        createdAt : Int;
    };

    public type AccessType = {
        #ReadOnly;
        #ReadWrite;
    };

    public type AccessPrivilege = {
        fileId: Nat;
        accessType: AccessType;
        expirationDate: Int;  // Time
    };

    public type FileMeta = {
        id : Text;
        user : User;
        name : Text;
        sharedWith : [User];
        fileSize : Nat;
        createdAt : Int;
        fileHash : Text;
    };



}

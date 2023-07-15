module{

    public type State = {
        caller : Principal;
        
    };

    public type User = Text;

    public type InitFile = {
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
module{

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
        accessible : Bool;
    };

    public type AccessType = {
        ReadOnly : Bool;
        ReadWrite : Bool;
    };

    public type FileMeta = {
        id : Text;
        user : User;
        name : Text;
        sharedWith : [User];
        fileSize : Nat;
        createdAt : Int;
        fileHash : Text;

    }
}
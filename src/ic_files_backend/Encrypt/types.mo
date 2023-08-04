import Principal "mo:base/Principal";
module {

    public type Encrypt__init__ = {
        key : Text;
        algo : Text;
        metadata : Blob;
    };

    public type State = {
        canister : Principal;
    }

}
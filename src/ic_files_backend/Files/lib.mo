import Types "types";

module {

    public class Handler(state : Types.State){

        // public func toStable() : Types.LocalStableState{
            
        // }

        //file name is the title of the file
        private func init(name : Text, owner : Principal, user : Text, fileSize : Nat,  fileType : Text, folder : Text, editable : Bool, sharedWith : [User], encrypted : Bool, accessible : Types.AccessType) : Types.InitFile {
            {
                  name; owner; user; fileSize; fileType; folder; false; editable; sharedWith; true; accessible;
            }
        };
        

        public func Create_File(init : Types.InitFile) : () {

        };

        public func Upload_File() : () {

        };

    }
};

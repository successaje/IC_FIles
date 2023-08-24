import Types "types";

module {

    public class Handler(state : Types.State){

        // public func toStable() : Types.LocalStableState{
            
        // }

        //file name is the title of the file
        private func init(name : Text, owner : Principal, user : Text, fileSize : Nat,  fileType : Text, folder : Text,edited : Bool, editable : Bool, sharedWith : [Types. User], encrypted : Bool, accessible : Types.AccessType, createdAt : Int) : Types.InitFile {
            {
                name; owner; user; fileSize; fileType; folder; edited; editable; sharedWith; encrypted; accessible; createdAt;
            }
        };

        
        
        // public func 

        public func Create_File(init : Types.InitFile) : () {

        };

        public func Upload_File() : () {

        }; 

       }
};

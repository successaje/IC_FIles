import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Time "mo:base/Time";
import TrieMap "mo:base/TrieMap";

import Types "types";

module {

    public class file(state : Types.State){

        // public func toStable() : Types.LocalStableState{
            
        // }

        var FileUploads : [(Principal, Types.InitFile)] = [];

        var FileHashMap : HashMap.HashMap<Principal, Types.InitFile> = HashMap.fromIter<Principal, Types.InitFile>(FileUploads.vals(), 10, Principal.equal, Principal.hash);

        public var filePK : Nat = 0;

        //file name is the title of the file
        private func init(name : Text, owner : Principal, user : Text, fileSize : Nat,  fileType : Text, folder : Text,edited : Bool, editable : Bool, sharedWith : [Types. User], encrypted : Bool, accessible : Types.AccessType, createdAt : Int) : Types.InitFile {
            {
                name; owner; user; fileSize; fileType; folder; edited; editable; sharedWith; encrypted; accessible; createdAt;
            }
        };

        
        
        // public func 

        public func Create_File(init : Types.InitFile) : () {

        };

        public func Create_Folder() : (){

        };

        public func Upload_File(caller : Principal, file : Types.InitFile) : () {
            switch(state._Users.GetUser(caller)){
                case(null){};
                case(?_){
                    FileHashMap.put(caller, file);
                };
            };
        };

        public func Upload_Contract() : (){

        };

    }
};

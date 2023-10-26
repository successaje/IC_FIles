import Buffer "mo:base/Buffer";
import Hash "mo:base/Hash";
import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Time "mo:base/Time";
import TrieMap "mo:base/TrieMap";

import Types "types";
import Users "../Users";

module {

    public class files(state : Types.State){

        // public func toStable() : Types.LocalStableState{
            
        // }

        var PrincipalFileUploads : [(Principal, Types.InitFile)] = [];
        var FileUploads : [(Nat, Types.InitFile)] = [];

        var FileHashMap : HashMap.HashMap<Nat, Types.InitFile> = HashMap.fromIter<Nat, Types.InitFile>(FileUploads.vals(), 10, Nat.equal, Hash.hash);
        var PrincipalFileHashMap : HashMap.HashMap<Principal, Types.InitFile> = HashMap.fromIter<Principal, Types.InitFile>(PrincipalFileUploads.vals(), 10, Principal.equal, Principal.hash);

        public var id : Nat = 0;

        //file name is the title of the file
        private func init(name : Text, owner : Principal, user : Text, fileSize : Nat,  fileType : Text, folder : Text,edited : Bool, editable : Bool, sharedWith : [Types. User], encrypted : Bool, accessible : Types.AccessType, createdAt : Int) : Types.InitFile {
            {
                id; name; owner; user; fileSize; fileType; folder; edited; editable; sharedWith; encrypted; accessible; createdAt;
            }
        };

        
        
        // public func 

        public func Create_File(init : Types.InitFile) : () {

        };

        public func Create_Folder() : (){

        };

        public func Upload_File(caller : Principal, file : Types.InitFile) : async Text {
            switch(state._Users.GetUser(caller)){
                case(null){};
                case(?_){
                    FileHashMap.put(id, file);
                    id += 1;
                };
            };
            return "You have successfully uploaded the File";
        };

        public func deleteFile(caller : Principal, id : Nat, name : Text) : (){
            // var user = state._Users.GetUser(caller);
            FileHashMap.delete(id)


        };

        public func getAllfiles(caller : Principal) : async [Types.InitFile] {
            var buffer = Buffer.Buffer<Types.InitFile>(0);
            for ((principal, file) in PrincipalFileHashMap.entries()){
                if (principal == caller) {
                    buffer.add(file);
                };
            };
            return buffer.toArray();
        };

        // public func isOwner(caller : Principal, id : Nat) : Bool {
        //     var file = FileHashMap.get(id);
        //     switch(file){
        //         case(null){};
        //         case(file){

        //         }
        //     }
        //     if (file.id == id) {
        //         return (file.owner == caller);
        //     }
        // };

    



        //  public func Upload_Contract() : (){

        // };

    }
};

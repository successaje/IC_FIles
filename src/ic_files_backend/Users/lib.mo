import Types "types";

import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";

module {

    public class User(state : Types.State) {

        var Profile__backup__ : [(Principal, Types.Profile__init__)] = [];
        var Profile__hash__ : HashMap.HashMap<Principal, Types.Profile__init__> = HashMap.fromIter<Principal, Types.Profile__init__>(Profile__backup__.vals(), 10, Principal.equal, Principal.hash);

        public func logIn(caller : Principal) : Bool {
            var state = Profile__hash__.get(caller);
            switch (state) {
                case null {
                    return false;
                };
                case (?(_)) {
                    return true;
                };
            };

        };
    };
};

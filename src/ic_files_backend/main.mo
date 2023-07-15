import Principal "mo:base/Principal";

shared (msg) actor class icfiles (){
  
  public query func whoami() : async Principal {
    msg.caller;
  };
  
};

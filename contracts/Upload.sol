//SPDX-License-Identifier:MIT
pragma solidity >=0.7.6;
contract Upload{
    struct Access{
        address user;
        bool access;
    }
    mapping(address=>string[]) value;
    mapping(address=>mapping(address=>bool)) ownership;
    mapping(address=>Access[]) accessList;
    mapping(address=>mapping(address=>bool)) prevownership;

    function add(address user,string memory url) public{
        value[user].push(url);
        

    }
    function allow(address user)public {
        ownership[msg.sender][user]=true;
        if(prevownership[msg.sender][user]){
            for(uint i=0;i<accessList[msg.sender].length;i++){
                if(accessList[msg.sender][i].user==user){
                    accessList[msg.sender][i].access=true;
                }


            }
        }
        else{
            accessList[msg.sender].push(Access(user,true));
            prevownership[msg.sender][user]=true;
        }
    }
    function disallow(address user)public{
        ownership[msg.sender][user]=false;
        for(uint i=0;i<accessList[msg.sender].length;i++){
            if(accessList[msg.sender][i].user==user){
                accessList[msg.sender][i].access=false;
            }
        }


    }
    function display(address _user) external view returns(string[] memory){
        require(_user==msg.sender||ownership[_user][msg.sender],"you don't have access");
        return value[_user];
    }
    function shareAccess() public view returns(Access[] memory){
      return accessList[msg.sender];
    }

//     function shareAccess(address[] memory users) public view returns(Access[] memory) {
//   Access[] memory accessList = new Access[](users.length);
//   for (uint i = 0; i < users.length; i++) {
//     accessList[i] = Access(users[i], true);
//   }
 


}
pragma solidity ^0.6.0;
//rather than importing what has been implmented in previously created code we just simply use the interface of that program
//and start implementing it...
interface  Q3TokenInterface
{
    function transfer(address from, address to, uint amount) external returns(bool) ;//it will transfer money to teh address "to" 
    function mint(uint)external returns (bool);// we will add money in current account i.e. intital the amount...
    function balances()external returns(uint);// it will simply show the amount of current address...
}

contract SchoolPayroll
{
    Q3TokenInterface public token;
    address public owner;
   constructor(Q3TokenInterface Q3Token) public// basically in this constructor we need to tell that we are referring you an address
    //which has been already deployed on Blockchain i.e. a contract with some address...
    
    
    {
        owner=msg.sender;//the address who will deploy this contract
        token=Q3Token;//so this will deployed token's address..
    }
    // if I wantto put adress instead of Q3TokenInterface
   // constructor (address adr) public
    //{
      //  owner=msg.sender;
      //  //token=Q3Token;// here you will see and error cuz thee type of token was Q3TokenInterface not address so we have to type cast it as below..
        //token =Q3TokenInterface(adr);
    //}
    
    function payFees(uint amount) external returns (string memory) 
    {
        token.transfer(msg.sender,owner,amount);
        return "Fees Paid!!";
    }
    function Salary(address teacher, uint amount) public returns (string memory) 
    {
        token.transfer(owner,teacher,amount);
        return "Salary Paid!!";
    }
}

// before proceeding we must have owners address then token delpoyed address and number of student's addresses
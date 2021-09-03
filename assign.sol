//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

contract Assignment {

    address public owner;
    
     struct Deal {
        address secondPerson; 
        bool paid;
        bool accepted;
        uint256 quantity;
    }
    
    
    Deal[] public deals;


    constructor() {
        owner = msg.sender;
    }
    
    
    
    function addDeal(uint256 quantity,address _secondPerson) public {
        require(msg.sender == owner, "Not Allowed");
        deals.push(
            Deal({
                secondPerson:_secondPerson,
                paid:false,
                accepted:false,
                quantity:quantity
            })
        );
    }
    
    
    function acceptOrder(uint256 orderId) public {
        Deal storage deal = deals[orderId];
        require(deal.secondPerson == msg.sender,"Not Allowed");
        deal.accepted = true;
    }
    
     function markPaymentDone(uint256 orderId) public {
        require(msg.sender == owner, "Not Allowed");

        Deal storage deal = deals[orderId];
        deal.paid = true;
    }
    
    
    
    
    
}
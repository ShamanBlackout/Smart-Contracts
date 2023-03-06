// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

/************************************************************************
Synopsis on which operators are most efficient gas consumers:
    (Please note these are all tested for uint)
 _1) ++
 _2) <= & >=
 _3) += & -=


************************************************************************/

contract GasUsage {
    function postIncrement(uint y) external pure returns(uint){
        uint x;
        for (x=0 ;x<y; x++)
            continue;
        
        return x;
     
    }
    //Better for gas
    function preIncrement(uint y) external pure returns(uint){
        uint x;
        for(x=0; x<y; ++x)
            continue;
        return x;
    }

    //better for gas
    function plusEqualAssignment(uint y) external pure returns(uint){
        uint x = 0;
        while(x < y){
            x+=1;
        }
        return x;
    }

    function regularAssignment(uint y) external pure returns(uint){
        uint x = 0;
        while(x < y){
            x = x + 1;
        }
        return x;

    }
    //better for gas
    function lessThanEqual(uint y) external pure returns (uint){

        uint x = 0;
        while(x <= y){
            x+=1;
        }
        return x;
    }

    function lessThan(uint y) external pure returns(uint){
        uint x = 0;
        while(x < y){
            x+=1;
        }
        return x;
    }

    //Testing if for loop addition is less costly than multiplication. Answer is no.
    function addTest(uint y) external pure returns(uint){
        uint x;
        for(x=0; x<y; x+=2)
        continue;

        return x;

    }

    function multTest(uint y) external pure returns(uint){
        uint x;
        x = 0;
        x = 2*y;
        return x;
        
    }

    // Feel free to change and test any combination to determine gas cost.
    function playground() external pure{

    }


}
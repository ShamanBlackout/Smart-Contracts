
// SPDX-License-Identifier: MIT
/**
 *Submitted for verification at Etherscan.io on 2020-10-19
*/

pragma solidity ^0.8.18;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";

contract ShamansBlessing is ERC20,ERC20PresetFixedSupply {

    uint256 private _initSupply = 500**decimals();
    

    constructor() ERC20PresetFixedSupply("ShamansBlessing","SMB",_initSupply,msg.sender) 
    {
    }


    }

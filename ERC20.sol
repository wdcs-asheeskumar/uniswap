// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyFirstToken is ERC20 {
    mapping(address => mapping(address => uint256))public _taxRecord;
    constructor()
        ERC20("Token2", "TKN2")
    {
        _mint(msg.sender,1000 * (10 **(decimals())));
    }

    function mint(address to, uint256 amount) public  {
        _mint(to,amount * (10 **(decimals())));
    }
}
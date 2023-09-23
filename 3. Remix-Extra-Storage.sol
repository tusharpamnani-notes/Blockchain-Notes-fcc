// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    // ExtraStorage is inherting SimpleStorage and has every functionality of SimpleStorage

    function store(uint256 _favouriteNumber) public override  {
        // to override this function, the parent function should be "virtual"
        favouriteNumber = _favouriteNumber + 5 ;
    }    
}

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

//inheritance
//child contract

contract AddFiveStorage is SimpleStorage{
    // +5
    // overrides
    // virtual override
    // add virtual keyword to the function which u want to override

    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;

    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

import "./SimpleStorage.sol";

contract StorageFactory {
        SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        // the call to this function will deploy the "SimpleStorage.sol" contract
        // one way to do this is copy all the contents of that contract and paste it here, this way this file will have 2 contracts
        // another way (efficient) is to import the contract.

        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);

        // this will return the addresses of all the deployers of the contract
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {

        // this function will be used to store a number "_simpleStorageNumber" to the contract deployed at an index "_simpleStorageIndex"
        /*
            SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
                // accesses the contract object at index "_simpleStorageIndex"

            simpleStorage.store(_simpleStorageNumber);
                // calling the "store()" function on our SimpleStorage object "simpleStorage"
                // storing the "simpleStorageNumber" to it
        */

        // Efficient way to do this:
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // this will work same as the "retrieve()" function of the SimpleStorage Contract
        
        /*
            SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
            return simpleStorage.retrieve();
        */

        // Efficient way to do this 

        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}

/*
    in order to interact with any contract, Address and ABI are required
    ABI = Application Binary Interface
*/

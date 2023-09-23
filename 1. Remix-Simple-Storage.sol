// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract SimpleStorage{
    uint256 favouriteNumber; 
    // this will be initaillized to 0
    // "public" states that the variable is publically viewable

    struct People {
        // structure named "People"

        uint256 favouriteNumber;
        string name;
    }

    mapping(string => uint256) public nameToFavouriteNmuber;
    // mapping works exactly like a dictionary
    // here, string acts as a "key" and uint256 acts as a "value" 

/*
    People public person = People({favouriteNumber: 2, name: "Hi"});
    // creating an object of the structure "People" called person with the values of "favouriteNumber" as 2 and "name" as "hi"
*/

    People[] public people; 
    // an array of data type People named "people"
    // since the size isn't mentioned, this is a dynamic array

    function store(uint256 _favouriteNumber) public {
        // _favouriteNumber is a variable passed as a parameter to the function
        // "public" states that the function is public

        favouriteNumber = _favouriteNumber; 
    }

    function retrieve() public view returns (uint256){
        // "view" states that the function does not modify the contract, it is just 6to view the state
        // "returns" states that the function returns something (here, it is "uint256". It is mandatory to specify the data type od the returned data)
        // there is no gas spent on "view" functions
        return favouriteNumber;
    }

    function addPerson( string memory _name, uint256 _favouriteNumber) public {
        people.push(People(_favouriteNumber, _name));
        // "people" is the array of data type "People"
        // ".push()" is a method to add elements to the array (similar to .push_back() in c++)
        // "_favouriteNumber" and "_name" from the parameters are being passed to the structure as parameters

        /*
            Another way to do this:
            People memory newPerson = People({favouriteNumber: _favouriteNumber, name: _name})
            people.push(newPerson);
        */

        /*
            Another way to do this:
            People memory newPerson = People(_favouriteNumber, _name})
            people.push(newPerson);
        */

        nameToFavouriteNmuber [_name] = _favouriteNumber;
        // this will take "name" as an input to return the "favouriteNumber" associated to that name
    }
}

/* 
    bool hasFavouriteNumber = true;
    string favouriteNumberInText = "five";
    int256 favouriteInt = -5;
    address myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes32 favouriteByte = "cat";
*/


/*
    calldata and memory are used to store the data temporarily
    storage stores the data even outside the function execution 
*/


/*
    calldata won't let you modify the data whereas memory lets you modify the data
*/

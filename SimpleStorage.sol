// SPDX-License-Identifier: MIT

//include version of solidity first step always
pragma solidity ^0.6.0;

contract SimpleStorage {

    // this will get initialized to 0!
    uint256 favoriteNumber;


    // structs are the solidity version of objects/classes
    struct People{
        uint256 favoriteNumber;
        string name;
    }

    //fun lil solidity array. this is a dynamic array. public visibility.
    People[] public people;

    //solidity version of dictionary. public visibility.
    mapping(string => uint256) public nameToFavoriteNumber;
    
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    //let the function know what it expects to return. view bc function is not making state change.
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    //when using a string as a parameter you have to put memory or storage. 
    //memory is a temporary place to store data whereas storage holds data between function calls
    //memory is wiped after execution, but each execution has access to storage
    //gas consumption of memory is less significant than the gas consumption of storage
    //so use memory for intermediate calculations and store the final result in storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }


}
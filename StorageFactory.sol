// SPDX-License_Identifier: MIT

pragma solidity ^0.6.0;

//basic import similar to other langs
import "./SimpleStorage.sol";

//solidity version of inheritance. storage factory now has all the attributes of simplestorage.
contract StorageFactory is SimpleStorage {
    //create a dynamic array of SimpleStorage contracts
    SimpleStorage[] public simpleStorageArray;

    //function to create a new simplestorage contract and add to dynamic array
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //address and abi needed to access a contract
        //this line has an explicit cast to the address type and initializes a simplestorage contract from the address
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
    }

     function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        //this line has an explicit cast to the address type and initializes a simplestorage contract from the address
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    }


}
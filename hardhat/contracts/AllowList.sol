//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Allowlist {
    uint8 public maxAllowlistedAddresses;

    mapping(address => bool) public allowlistedAddresses;

    uint8 public numAddressesAllowlisted;

    constructor(uint8 _maxAllowlistedAddresses) {
        maxAllowlistedAddresses = _maxAllowlistedAddresses;
    }

    function addAddressToAllowlist() public {
        require(
            !allowlistedAddresses[msg.sender],
            "Wallet address has already been allowlisted"
        );
        require(
            numAddressesAllowlisted < maxAllowlistedAddresses,
            "More wallet addresses cannot be added, maximum number allowed reached"
        );
        allowlistedAddresses[msg.sender] = true;
        numAddressesAllowlisted += 1;
    }
}

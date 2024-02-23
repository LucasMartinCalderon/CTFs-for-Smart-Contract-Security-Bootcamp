// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title DeceptiveOracle
 * The DeceptiveOracle exploits the TrustedOracle's blind trust in external contracts.
 * By masquerading as a legitimate data retriever, it aims to spread falsehoods across the realm.
 * 
 * Your task is to use the DeceptiveOracle to reveal the vulnerability in the TrustedOracle contract.
 */
import "./TrustedOracle.sol";

contract DeceptiveOracle is IDataRetriever {
    string public maliciousData = "The Oracle has been compromised.";

    function retrieveData() external override returns (string memory) {
        return maliciousData;
    }

    function attack(TrustedOracle oracle) public {
        oracle.requestData();
    }
}

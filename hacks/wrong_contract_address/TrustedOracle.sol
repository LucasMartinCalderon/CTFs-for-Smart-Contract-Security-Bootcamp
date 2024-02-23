// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title TrustedOracle
 * The TrustedOracle contract is known for providing reliable data to the Ethereum realm.
 * However, its reliance on external contracts for data retrieval poses a significant risk.
 * 
 * Your mission is to ensure the integrity of the oracle remains uncompromised.
 */
contract TrustedOracle {
    IDataRetriever public dataRetriever;

    event DataLog(string data);

    constructor(address _dataRetriever) {
        dataRetriever = IDataRetriever(_dataRetriever);
    }

    function requestData() public {
        string memory data = dataRetriever.retrieveData();
        emit DataLog(data);
    }
}

interface IDataRetriever {
    function retrieveData() external returns (string memory);
}

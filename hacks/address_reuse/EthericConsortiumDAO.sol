// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title EthericConsortiumDAO
 * @dev Manages proposals for governing magical artifacts. Vulnerable to the Shapeshifter's Gambit.
 */
contract EthericConsortiumDAO {
    struct Proposal {
        address target;
        bool approved;
        bool executed;
    }

    address public archMage = msg.sender;
    Proposal[] public proposals;

    function approveArtifactUse(address target) external {
        require(msg.sender == archMage, "Only the Arch Mage can approve");
        proposals.push(Proposal({target: target, approved: true, executed: false}));
    }

    function enactProposal(uint256 proposalId) external payable {
        Proposal storage proposal = proposals[proposalId];
        require(proposal.approved, "Proposal not approved");
        require(!proposal.executed, "Proposal already enacted");

        proposal.executed = true;
        (bool success,) = proposal.target.delegatecall(abi.encodeWithSignature("enactArtifactPower()"));
        require(success, "Enactment failed");
    }

    // Include hints about the vulnerability within comments
    // Question: How can the trust in an approved proposal's immutability be violated?
}


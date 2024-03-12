// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title MysticGallery
 * @dev This contract represents a gallery where artists can submit their artworks for approval.
 * Upon approval, their art becomes part of an exclusive exhibition. However, due to a flaw in the
 * signature verification process, approvals can be replayed, leading to unauthorized art exhibitions.
 */

import "./ECDSA.sol";

contract MysticGallery {
    using ECDSA for bytes32;

    address public curator;
    mapping(address => bool) public approvedArtists;
    mapping(bytes32 => bool) public processedApprovals;

    event ArtworkSubmitted(address artist, string artwork);
    event ArtworkApproved(address artist);

    constructor() {
        curator = msg.sender;
    }

    // Artists submit their artwork along with a signature from the curator for approval.
    function submitArtwork(string memory _artwork, bytes memory _signature) public {
        require(!approvedArtists[msg.sender], "Artist already approved");
        bytes32 approvalHash = keccak256(abi.encodePacked(msg.sender, _artwork));
        require(_verifySignature(approvalHash, _signature), "Invalid signature");
        approvedArtists[msg.sender] = true;
        emit ArtworkSubmitted(msg.sender, _artwork);
        emit ArtworkApproved(msg.sender);
    }

    // Internal function to verify the curator's signature.
    function _verifySignature(bytes32 _approvalHash, bytes memory _signature) private view returns (bool) {
        bytes32 ethSignedHash = _approvalHash.toEthSignedMessageHash();
        return ethSignedHash.recover(_signature) == curator;
    }
}

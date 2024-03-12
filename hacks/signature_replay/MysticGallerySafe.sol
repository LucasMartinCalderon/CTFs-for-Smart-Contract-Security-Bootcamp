// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./ECDSA.sol";

/**
 * @title MysticGallerySafe
 * @dev This contract introduces a nonce mechanism to the MysticGallery, mitigating the signature replay vulnerability.
 * Artists submit their artworks for approval with a curator's signature that now includes a nonce, making each approval
 * unique and tied to a specific transaction.
 */

contract MysticGallerySafe {
    using ECDSA for bytes32;

    address public curator;
    mapping(address => mapping(uint256 => bool)) public approvedArtists;
    uint256 public nonce;

    event ArtworkSubmitted(address indexed artist, string artwork, uint256 nonce);
    event ArtworkApproved(address indexed artist, uint256 nonce);

    constructor() {
        curator = msg.sender;
        nonce = 0;
    }

    // Artists submit their artwork along with a signature from the curator that includes a nonce for approval.
    function submitArtwork(string memory _artwork, bytes memory _signature, uint256 _nonce) public {
        require(!approvedArtists[msg.sender][_nonce], "Nonce already used or artist already approved");
        bytes32 approvalHash = keccak256(abi.encodePacked(msg.sender, _artwork, _nonce));
        require(_verifySignature(approvalHash, _signature), "Invalid signature");
        approvedArtists[msg.sender][_nonce] = true;
        emit ArtworkSubmitted(msg.sender, _artwork, _nonce);
        emit ArtworkApproved(msg.sender, _nonce);

        // Increment nonce to ensure each approval is unique
        nonce++;
    }

    // Internal function to verify the curator's signature including the nonce.
    function _verifySignature(bytes32 _approvalHash, bytes memory _signature) private view returns (bool) {
        bytes32 ethSignedHash = _approvalHash.toEthSignedMessageHash();
        return ethSignedHash.recover(_signature) == curator;
    }
}

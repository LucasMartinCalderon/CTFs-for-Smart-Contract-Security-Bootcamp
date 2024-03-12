// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SecureTreasureHunt {
    struct Commit {
        bytes32 solutionHash;
        uint256 commitTime;
        bool revealed;
    }

    mapping(address => Commit) public commits;
    bytes32 public targetHash = 0xe2315fb60c3088e4085419e6e1bc56453808bafaf9457ee103c462d26cf5b547;
    uint256 public reward;
    address public winner;
    bool public ended;

    event TreasureClaimed(address winner);

    constructor() payable {
        reward = msg.value;
    }

    modifier gameActive() {
        require(!ended, "The hunt has already concluded.");
        _;
    }

    function commitSolution(bytes32 _solutionHash) public gameActive {
        require(commits[msg.sender].commitTime == 0, "Commit already made.");
        commits[msg.sender] = Commit({
            solutionHash: _solutionHash,
            commitTime: block.timestamp,
            revealed: false
        });
    }

    function revealSolution(string calldata _solution, string calldata _secret) public gameActive {
        Commit storage userCommit = commits[msg.sender];
        require(userCommit.commitTime != 0 && !userCommit.revealed, "Solution not committed or already revealed.");
        require(block.timestamp > userCommit.commitTime, "Cannot reveal in the same block.");

        bytes32 solutionHash = keccak256(abi.encodePacked(msg.sender, _solution, _secret));
        require(solutionHash == userCommit.solutionHash, "Incorrect solution hash.");
        require(keccak256(abi.encodePacked(_solution)) == targetHash, "Incorrect solution.");

        userCommit.revealed = true;
        winner = msg.sender;
        ended = true;

        emit TreasureClaimed(msg.sender);

        payable(msg.sender).transfer(reward);
    }
}

pragma solidity ^0.5.0;

contract SocialNetwork {
    string public name; //state variable that belongs to smart contract
    uint public postCount = 0;
    mapping(uint => Post) public posts;

    struct Post {
        uint id;
        string content;
        uint tipAmount;
        address author;
    }

    constructor() public{
        name = "Ethereum Social Network";
    }
    function createPost(string memory _content) public {
        // Increment post count
        postCount ++;
        //create post
        posts[postCount] = Post(postCount, _content, 0, msg.sender);
    }
}
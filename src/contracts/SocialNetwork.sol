pragma solidity ^0.5.0;

contract SocialNetwork {
    string public name; //state variable that belongs to smart contract
    uint public postCount = 0;
    mapping(uint => Post) public posts;

    struct Post {
        uint id;
        string content;
        uint tipAmount;
        address payable author;
    }

    event PostCreated(
        uint id,
        string content,
        uint tipAmount,
        address payable author
    );

    event PostTipped(
        uint id,
        string content,
        uint tipAmount,
        address payable author
    );

    constructor() public{
        name = "Decentralized Social Network";
    }

    //this is write function so we must pay gas
    function createPost(string memory _content) public {
        //Require content so the value must not be null
        require(bytes(_content).length > 0);
        // Increment post count
        postCount ++;
        //create post
        posts[postCount] = Post(postCount, _content, 0, msg.sender);
        //Trigger event
        emit PostCreated(postCount, _content, 0, msg.sender);

    }
    function tipPost(uint _id) public payable {
        //make sure id is valid
        require(_id > 0 && _id <= postCount);
        //Fetch post
        Post memory _post = posts[_id];
        //Fetch author
        address payable _author = _post.author;
        //pay author
        address(_author).transfer(msg.value);
        //Increment tip amount
        // 1 ether = 1000000000000000000 wei
        _post.tipAmount = _post.tipAmount + msg.value;
        //update post
        posts[_id] = _post;
        //trigger event
        emit PostTipped(postCount, _post.content, _post.tipAmount, _author);
    }
}
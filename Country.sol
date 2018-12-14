// immediate problems:
// 1. Active/inactive must pend for some time before slipping inactive, so we need timestamps on all proposals.
// 2. Need to track a user's active proposals
// 3. Need to know if the user is already enrolled in the nation. 

// What it might just add up to, interestingly enough, is that people making a proposal might have to spend a fair bit of eth, which isn't necessarily bad because it might make people consider before proposing something. 

// we will need a larger contract for the Polix.

pragma solidity ^0.4.17;

contract Polix {
    Country[] public countries;
    mapping(address => bool) public users;
    mapping(address => bool) public citizens;

    function joinPolix() public {
      // require the person not be enrolled.
        require(!users[msg.sender]);
      // enrolls them. 
        users[msg.sender] = true;
        citizens[msg.sender] = false;
    }

    // now to join a country. you must be a user, and not a known citizen.
    function joinCountry(uint index) public {
        require(users[msg.sender]);
        require(citizens[msg.sender] == false);

        // this country's enroll function is called and the parent contract registers you as a citizen. The syntax here is probably wrong but the logic is solid: the parent contract prevents people from having multiple citizenships.
        countries[index].becomeCitizen();
        citizens[msg.sender] = true; 
    }
}

contract Country { 
    mapping(address => bool) public citizens;
    uint public population;
    Proposal[] public proposals;
    // this struct will be the fundament of our national proposals.  anyone can submit a proposal, but we will restrict the number to prevent brigading. I'm thinking 5 active proposals at a  time.
    struct Proposal {
        string description;
        uint value;
        address recipient;
        address proposer;
        bool complete;
        bool active;
        uint approvalCount;
        mapping(address => bool) ayes;
    }
    
    modifier citizenOnly() {
        require(citizens[msg.sender]);
        _;
    }
    
    // allows someone not already listed in the country's citizenry to enroll in the country's population. 
    
    // we need to know if the msg.sender ! belong to another country, which we can either do in the db to keep gas prices down, or we can nest the countries in  a broader contract and read people's citizenship from the contract, which is probably the more correct way to do it, but it may be awfully gas-intensive.
    
    // just think about it before you go crazy with the for loops.
    function becomeCitizen() public {
        citizens[msg.sender] == true;
        population++;
    }
        
    // this does precisely the opposite thing, allows someone to retract their citizenship..
    function leaveCountry() citizenOnly public {
        citizens[msg.sender] == false;
        population--;
    }
    
    // Here's where it gets a bit tricky, b/c we need to limit msg.sender's active requests. That also we might do on the frontend.
    function propose(string description, uint value, address recipient) citizenOnly public {
        Proposal memory newProposal = Proposal({
            description: description,
            value: value,
            recipient: recipient,
            complete: false,
            active: true,
            approvalCount: 0
        });
        
        proposals.push(newProposal);
    }
    
    function vote(uint index) public citizenOnly {
        Proposal storage proposal = proposals[index];
        // require that they have not voted yet.
        require(!proposal.ayes[msg.sender]);
        
        // lists the citizen as a voter.
        proposal.ayes[msg.sender] = true;
        
        // increases the proposal's approval count.
        proposal.approvalCount++;
    }
    
    // allows the proposal to be passed by any citizen once it reaches a sufficient approval count.
    function passResolution(uint index) public {
        Proposal storage proposal = proposals[index];
        require(!proposal.complete);
        require(proposal.active);
        require(proposal.approvalCount > (citizenship / 2));
        
        proposal.recipient.transfer(proposal.value);
        proposal.complete = true;
        proposal.active = false;
    }
    
    function reactivateResolution(uint index) public {
        Proposal storage proposal = proposals[index];
        
        // require that the proposal be inactive and incomplete.
        require(!proposal.active);
        require(!proposal.complete);
        require(msg.sender != proposal.proposer);
        
        proposal.active = true;
    }
}
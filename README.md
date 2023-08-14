## ZK Voting

## Nullifiers

### Overview

We saw in the previous branch that the user could double vote. To avoid this we use `nullifiers`. Nullifiers help us to only allow usage of a proof once.

**Steps Involved:**

* Changing the circuit to include a nullifier

```rust
let nullifier = std::hash::pedersen([root, secret, proposalId]);
```

* Changing the voting contract to store the nullifier when it is used and to throw an error when the nullifier is used again

```solidity
mapping(bytes32 hash => bool isNullified) nullifiers;
...

require(!nullifiers[nullifierHash], "Proof has been already submitted");
...

nullifiers[nullifierHash] = true;
```

* Changing the tests to accomodate changes.

### Setup

* Run smart contract tests to verify the changed functionality

```bash
forge test
```

* You can run a local node to deploy these new contracts

```bash
anvil
```

* Deploy these contracts on the local node

```bash
forge script scripts/Voting.s.sol:DeploymentScript --rpc-url http://127.0.0.1:8545/ --broadcast --verify -vvvv
```

## Resources

* [Foundry Book](https://book.getfoundry.sh/)

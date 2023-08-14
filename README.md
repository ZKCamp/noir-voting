## ZK Voting

## Smart Contracts

### Overview

We have slightly modified the circuit from last branch to accomodate the usecase. Noe, we need to integrate it with smart contracts to build the application.

**Steps Involved:**

* Generating a verifier contract from the circuit. This contract will help us in verification of the generated proof. You can do this by running the following command from `circuits/` directory

```bash
nargo run codegen-verifier
```

Post the execution of this step, you will notice a newly generated [contract](circuits/contract/circuits/plonk_vk.sol).

* Writing a [voting contract](contracts/Voting.sol) which users can use to prove membership and cast votes anonymously.

* Writing tests to validate the functionality of the application.

### Setup

* Install foundry by following the steps [here](https://book.getfoundry.sh/getting-started/installation). We will use foundry for testing and deploying our smart contracts.

* Install the `forge-std` lib which will be used in our testing using the command below

```bash
forge install https://github.com/foundry-rs/forge-std --no-commit
```

* Run smart contract tests

```bash
forge test
```

**You will notice that out of 4 tests, only 3 pass. The `testFail_doubleVoting` fails because with our current circuit, the user can still cast multiple votes. We will fix this in the next branch!**

* You can run a local node to deploy these contracts

```bash
anvil
```

* Rename the `.env.example` file to `.env`

* Deploy these contracts on the local node

```bash
forge script scripts/Voting.s.sol:DeploymentScript --rpc-url http://127.0.0.1:8545/ --broadcast --verify -vvvv
```

## Resources

* [Foundry Book](https://book.getfoundry.sh/)

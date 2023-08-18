## ZK Voting

## Security

### Overview

The circuit implementation from last branch had an inherent flaw and could be frontrun. Since vote was not included in the circuit, an attacker could pick the proof and other public parameters from mempool and just change the vote.

__Improvement__

* We have included the vote as a public input to the [circuit](circuits/src/main.nr)

* During the verification, the vote is verified to make sure the proof was generated with the same vote

* Even if the attacker tries to frontrun, they will not be able to change the vote hence not gaining anything out of making that transaction. Refer to the `testFail_changedVote` in [tests](test/Voting.t.sol)

## Resources

* [Front running](https://medium.com/degate/an-analysis-of-ethereum-front-running-and-its-defense-solutions-34ef81ba8456)

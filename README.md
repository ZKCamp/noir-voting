## ZK Voting

## Merkle Tree - Proof of Membership

### Circuit Overview

The goal here is to replace commitment list with a more suitable option - `Merkle Trees`. Instead of maintaining the whole list of user commitments publically, we can just maintain a single hash - merkle root. You can read more about merkle trees [here](https://brilliant.org/wiki/merkle-tree/).

**Steps Involved:**

* We create a merkle tree from commitments of secrets

```rust
let comm_1 = std::hash::pedersen([1])[0];
let comm_2 = std::hash::pedersen([2])[0];
let comm_3 = std::hash::pedersen([3])[0];
let comm_4 = std::hash::pedersen([4])[0];

let left_branch = std::hash::pedersen([comm_1, comm_2])[0];
let right_branch = std::hash::pedersen([comm_3, comm_4])[0];

let root = std::hash::pedersen([left_branch,  right_branch])[0];
```

* The user provides root, hash paths, index and secret to the circuit

```rust
let hash_paths = [comm_2, right_branch];

main(root, hash_paths, 0, 1);
```

* The circuit checks that the hash of the secret is a member of the merkle tree using index and hash paths.

```rust
let commitment = std::hash::pedersen([secret])[0];
let check_root = std::merkle::compute_merkle_root(commitment, index, hash_paths);   
assert (check_root == root);
```

### Running the circuit

* Change the working directory to `circuits/`

```bash
cd circuits/
```

* Run tests

```bash
nargo test
```

If you have any `std::println` statements in your code, you can use `nargo test --show-output` command to show the output.

* Generating the proof

```bash
nargo prove
```

* Verifying the proof

```bash
nargo verify
```

## Resources

* [Proof of Membership in Noir](https://noir-lang.org/examples/merkle-proof/)
* [Merkle Trees](https://brilliant.org/wiki/merkle-tree/)

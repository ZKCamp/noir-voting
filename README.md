## ZK Voting

## Identity Commitments

### Circuit Overview

The goal here is to enable the user to prove that they are a member of a certain group (proof of membership) by knowing a secret value.

**Steps Involved:**

* We create a list of commitments of secrets. This list is public

```rust
let comm_1 = std::hash::pedersen([1])[0];
let comm_2 = std::hash::pedersen([2])[0];
let comm_3 = std::hash::pedersen([3])[0];
let comm_4 = std::hash::pedersen([4])[0];

let commitments_list = [comm_1, comm_2, comm_3, comm_4]; 
```

* The user provides public commitment list, the index and the secret to the circuit

```rust
main(commitments_list, 0, 1)
```

* The circuit checks that the hash of the secret is equal to the value at a given index or not

```rust
let commitment = std::hash::pedersen([secret])[0];
assert(comms_list[index] == commitment);
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

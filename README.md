## ZK Voting

## Integration Tests

### Overview

We can generate proof and verify using Noir CLI. Noir also provides another way to generate proof and verify using a typescript library. In this branch we will use the typescript library of Noir to write integration tests and a script to populate `Prover.toml` for our circuit.

**Test Files:**

* The common utils to handle Noir related functions is [here](utils/)

* The integration test file, written using vitest is [here](test/integration.test.ts)

### Setup

* Install dependencies

```
yarn
```

* Populate the `Prover.toml` file using the command below

```bash
yarn run populate-prover-toml
```

* Run integration tests

```bash
yarn run integration-test
```

## Resources

* [Noir Typescript Docs](https://noir-lang.org/typescript)
* [Vitest Docs](https://vitest.dev/guide/)

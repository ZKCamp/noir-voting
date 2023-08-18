use dep::std;

fn main(root : pub Field, index : Field, hash_path : [Field; 2], secret: Field, proposalId: pub Field, vote: pub u8) -> pub Field {
    let note_commitment = std::hash::pedersen([secret]);
    let nullifier = std::hash::pedersen([root, secret, proposalId]);

    let check_root = std::merkle::compute_merkle_root(note_commitment[0], index, hash_path);
    assert(root == check_root);
    assert(vote <= 1);

    nullifier[0]
}


#[test]
fn test_valid_build_merkle_tree() {
    let commitment_0 =  std::hash::pedersen([1])[0];
    let commitment_1 =  std::hash::pedersen([2])[0];
    let commitment_2 =  std::hash::pedersen([3])[0];
    let commitment_3 =  std::hash::pedersen([4])[0];

    let left_branch = std::hash::pedersen([commitment_0, commitment_1])[0];
    let right_branch = std::hash::pedersen([commitment_2, commitment_3])[0];

    let root = std::hash::pedersen([left_branch, right_branch])[0];
    
    let proposalId = 0;
    let vote = 1;

    let nullifier = main(
        root,
        0,
        [commitment_1, right_branch],
        1,
        proposalId,
        vote
    );

    let expected_nullifier = std::hash::pedersen([root, 1, proposalId]);

    assert(nullifier == expected_nullifier[0]);
}

use dep::std;

fn main(root: pub Field, hash_paths: [Field; 2], index: Field, secret: Field) {
    let commitment = std::hash::pedersen([secret])[0];
    let check_root = std::merkle::compute_merkle_root(commitment, index, hash_paths);   
    assert (check_root == root);
}

#[test]
fn main_test() {
    let comm_1 = std::hash::pedersen([1])[0];
    let comm_2 = std::hash::pedersen([2])[0];
    let comm_3 = std::hash::pedersen([3])[0];
    let comm_4 = std::hash::pedersen([4])[0];

    let left_branch = std::hash::pedersen([comm_1, comm_2])[0];
    let right_branch = std::hash::pedersen([comm_3, comm_4])[0];
    
    let root = std::hash::pedersen([left_branch,  right_branch])[0];

    let hash_paths = [comm_2, right_branch];

    main(root, hash_paths, 0, 1);

    let hash_paths3 = [comm_4, left_branch];

    // For User 3
    main(root, hash_paths3, 2, 3);
}
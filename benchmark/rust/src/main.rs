extern crate nalgebra as na;
use na::DMatrix;
use rand;
use rand::Rng;
use std::time::Instant;

fn main() {
    let mut rng = rand::thread_rng();
    let left_size = rng.gen_range(0..1000) + 1001;
    let shared_size = rng.gen_range(0..1000) + 1001;
    let right_size = rng.gen_range(0..1000) + 1001;
    let left: DMatrix<f32> =
        DMatrix::from_fn(left_size, shared_size, |_, _| rng.gen_range(0.0..100.0));
    let right: DMatrix<f32> =
        DMatrix::from_fn(shared_size, right_size, |_, _| rng.gen_range(0.0..100.0));

    let start = Instant::now();
    let _ = left * right;
    let end = start.elapsed();
    println!("{} {} {} {:?}", left_size, shared_size, right_size, end);
}

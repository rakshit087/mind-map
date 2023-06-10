fn main() {
    // Tuples
    let tup: (i32, u32, i16) = (1, 2, 3);
    let (x, y, z) = tup;
    println!("{}", x);
    let index_value = tup.1;
    // Arrays
    let a = [1, 2, 3];
    let b: [i32; 5] = [1, 2, 3, 4, 5]; // array of type i32 and size 5
    let c = [0; 5]; // [0, 0 , 0, 0, 0]
    let index_value = b[2]; // gives 3
}

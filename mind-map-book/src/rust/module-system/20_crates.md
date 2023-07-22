A crate is the smallest amount of code that the Rust compiler considers at a time.  
* Binary crates are programs that can be compiled to binary executables. They must have a main function.
* Library crates don’t have a main function and can’t be compiled directly. They’re intended to be used as dependencies of other programs.
* A package is a bundle of one or more crates that provides a set of functionality.
* A package contains a Cargo.toml file that describes how to build those crates.
* A package can contain as many binary crates but only one library crate.
use std::net::IpAddr;

struct Args {
    flag: String,
    ipaddr: IpAddr,
    threads: u16
}

fn main() {
    let args: Vec<String> = std::env::args().collect();

}

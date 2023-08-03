use greeter;

fn main() {
    println!("Hello from greeter-grpc!");
    println!("invoke greeter::print() from greeter-grpc/main.rs");
    greeter::print();
}

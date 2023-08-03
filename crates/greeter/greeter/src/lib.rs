mod internal;

pub fn print() {
    println!("invoke internal::print from greeter::lib.print()");
    internal::print();
}

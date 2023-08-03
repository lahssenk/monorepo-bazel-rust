pub fn print() {
    println!("hello from greeter/internal");
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn should_pass() {
        print();
    }
}

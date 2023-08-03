pub fn do_something() {
    println!("hello from greeter/internal");
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn should_pass() {
        do_something();
    }
}

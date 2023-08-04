ISSUE 01: use greeter -> bazel rust can not resolve import of member crate in workspace
In order to further experiment with bazel in a rust workspace, I have 2 member crates (greeter, greeter-grpc)
and greeter-grpc imports greeter. In greeter's Cargo.toml, I define the dependency on greeter member crate,
provide the path where to find it (instead of fetching from crates.io).

Bazel run would FAIL because of `use greeter;`, greeter failed to be resolved.

Reminder: I chose to use crates_universe from rules_rust to handle external dependencies, from Cargo.toml files.
But crates_universe ignores 'path', therefor the dependencies must be added explicitly in each target via with 
deps = ["//greeter"].

I had this done in lib and test targets, forgot to also put it into bin, which solved the issue.  

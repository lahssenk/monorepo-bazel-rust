load("@cargo_workspace//:defs.bzl", "aliases", "all_crate_deps")
load("@rules_rust//rust:defs.bzl", "rust_library", "rust_test")

rust_library(
    name = "greeter_lib",
    aliases = aliases(),
    deps = all_crate_deps(
        normal = True,
    ),
    proc_macro_deps = all_crate_deps(
        proc_macro = True,
    ),
)

rust_test(
    name = "greeter_unit_test",
    crate = ":greeter_lib",
    aliases = aliases(
        normal_dev = True,
        proc_macro_dev = True,
    ),
    deps = all_crate_deps(
        normal_dev = True,
    ),
    proc_macro_deps = all_crate_deps(
        proc_macro_dev = True,
    ),
)

# This tells bazel to load the rust_binary rule from the rules_rust package
load("@rules_rust//rust:defs.bzl", "rust_binary")

rust_binary(
    #We are going to call the target/binary summation
    name = "greeter_bin",
    #The list of src files it needs (just main.rs)
    srcs = ["src/main.rs"],
    #Any libraries/crates it depends on, for now we'll leave this blank
    deps = [":greeter_lib"],
    #The crate_root file, this would default to main.rs but we put it in for clarity
    crate_root = "src/main.rs",
)
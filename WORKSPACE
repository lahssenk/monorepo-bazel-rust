load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# download rules_rust
http_archive(
    name = "rules_rust",
    sha256 = "4a9cb4fda6ccd5b5ec393b2e944822a62e050c7c06f1ea41607f14c4fdec57a2",
    urls = ["https://github.com/bazelbuild/rules_rust/releases/download/0.25.1/rules_rust-v0.25.1.tar.gz"],
)

load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")

rules_rust_dependencies()

rust_register_toolchains(
    edition = "2021",
    versions = [
        "1.71.0"
    ],
)

load("@rules_rust//crate_universe:repositories.bzl", "crate_universe_dependencies")

crate_universe_dependencies()

# read external dependencies from Cargo workspace
load("@rules_rust//crate_universe:defs.bzl", "crates_repository")

crates_repository(
    name = "cargo_workspace",
    cargo_lockfile = "//:Cargo.lock",
    lockfile = "//:Cargo.Bazel.lock",
    manifests = ["//:Cargo.toml"],
)

load("@cargo_workspace//:defs.bzl", "crate_repositories")

# dowload all external dependencies read from Cargo workspace
crate_repositories()


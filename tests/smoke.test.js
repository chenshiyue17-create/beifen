const { existsSync } = require("node:fs");
const { join } = require("node:path");
const { execFileSync } = require("node:child_process");

const root = join(__dirname, "..");

function assert(condition, message) {
  if (!condition) {
    throw new Error(message);
  }
}

assert(existsSync(join(root, "README.md")), "README.md is missing");
assert(existsSync(join(root, "config", "config.yaml")), "config/config.yaml is missing");
assert(existsSync(join(root, "vendor", "google-gemini-cli-0.45.2.tgz")), "vendor tarball is missing");
assert(existsSync(join(root, "config", "repositories.yaml")), "config/repositories.yaml is missing");
assert(existsSync(join(root, "output", ".gitkeep")), "output placeholder is missing");
assert(existsSync(join(root, "logs", ".gitkeep")), "logs placeholder is missing");

const nodeMajor = Number(process.versions.node.split(".")[0]);
assert(nodeMajor >= 20, `Node.js >=20 is required, got ${process.version}`);

const version = execFileSync("gemini", ["--version"], { encoding: "utf8" }).trim();
assert(version === "0.45.2", `Expected gemini 0.45.2, got ${version}`);

console.log("smoke test passed");

# eunomia-bpf Homebrew tap

Official Homebrew tap for eunomia-bpf projects.

## AgentSight

AgentSight is a system-wide AI agent tracing and monitoring tool powered by
eBPF.

```bash
brew tap eunomia-bpf/tap
brew install agentsight
```

Then run on Linux:

```bash
sudo agentsight top
```

## Planned formulae

- `bpftime`: blocked on stable release assets or a reviewed source-build formula.
- `actplane`: add after release assets and install behavior are stable.
- `wasm-bpf`: add after release/version alignment.

## Notes

This tap is the official Homebrew route for eunomia-bpf projects. Formulae must
install a real tool and provide at least a working `--version` or `--help` test.

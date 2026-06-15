class Agentsight < Formula
  desc "System-wide AI agent tracing and monitoring with eBPF"
  homepage "https://github.com/eunomia-bpf/agentsight"
  url "https://github.com/eunomia-bpf/agentsight/releases/download/v0.2.26/agentsight",
      using: :nounzip
  sha256 "18b0e4420f3808233509dc0ce2c6b1106f80585a21761a33460b1b8d0b6ae206"
  license "MIT"
  version "0.2.26"

  depends_on :linux
  depends_on "patchelf" => :build
  depends_on "glibc"

  def install
    bin.install "agentsight"
    system Formula["patchelf"].opt_bin/"patchelf",
           "--set-interpreter", Formula["glibc"].opt_lib/"ld-linux-x86-64.so.2",
           "--set-rpath", Formula["glibc"].opt_lib,
           bin/"agentsight"
  end

  test do
    assert_match "agentsight 0.2.26", shell_output("#{bin}/agentsight --version")
    assert_match "record", shell_output("#{bin}/agentsight --help")
  end
end

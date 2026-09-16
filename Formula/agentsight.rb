class Agentsight < Formula
  desc "System-wide AI agent tracing and monitoring with eBPF"
  homepage "https://github.com/eunomia-bpf/agentsight"
  url "https://github.com/eunomia-bpf/agentsight/releases/download/v1.0.25/agentsight-x86_64",
      using: :nounzip
  sha256 "b390e507765f5e042ed3aa913c41095a973efa2fb65117d3486744df804abc81"
  license "MIT"

  depends_on "gcc" => :build
  depends_on "patchelf" => :build
  depends_on "glibc"
  depends_on :linux

  def install
    bin.install "agentsight-x86_64" => "agentsight"
    system formula_opt_bin("patchelf")/"patchelf",
           "--set-interpreter", formula_opt_lib("glibc")/"ld-linux-x86-64.so.2",
           "--set-rpath", formula_opt_lib("glibc"),
           bin/"agentsight"
  end

  test do
    assert_match "agentsight 1.0.25", shell_output("#{bin}/agentsight --version")
    assert_match "record", shell_output("#{bin}/agentsight --help")
  end
end

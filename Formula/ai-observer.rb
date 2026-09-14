class AiObserver < Formula
  desc "Local completion observer for terminal AI tools"
  homepage "https://github.com/yosyus-Yo/ai-observer"
  url "https://github.com/yosyus-Yo/ai-observer/releases/download/v0.2.0/ai-observer-local-0.2.0.tgz"
  sha256 "94f196b18faf06eadb81fccc18f1a9a1ac084ba08fea99d4e6dc9adee4bec776"
  license "MIT"

  depends_on "node@22"

  def install
    source_root = (buildpath/"package").directory? ? buildpath/"package" : buildpath
    libexec.install source_root.children
    (bin/"ai-observer").write_env_script libexec/"dist/src/cli.js",
      PATH: "#{formula_opt_bin("node@22")}:$PATH"
  end

  service do
    run [opt_bin/"ai-observer", "start", "--foreground", "--no-open"]
    keep_alive crashed: true
    log_path var/"log/ai-observer.log"
    error_log_path var/"log/ai-observer.error.log"
    environment_variables PATH: "#{formula_opt_bin("node@22")}:#{std_service_path_env}"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ai-observer --version").strip
  end
end

class Riff < Formula
  desc "Local-first voice notes and transcription CLI"
  homepage "https://github.com/calebcauthon/riff"
  url "https://github.com/calebcauthon/riff/archive/refs/tags/v0.3.6.tar.gz"
  sha256 "eff771147c852339d2503cdf63e44227b389a15d5a6e39efcf05bad12a484007"
  head "https://github.com/calebcauthon/riff.git", branch: "main"

  depends_on "rust" => :build
  depends_on "ffmpeg"
  depends_on "python@3.12"

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
    libexec.install "scripts"
  end

  test do
    assert_match "riff ", shell_output("#{bin}/riff --version")
    assert_match "parakeet_script", shell_output("#{bin}/riff doctor")
  end
end

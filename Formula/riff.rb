class Riff < Formula
  desc "Local-first voice notes and transcription CLI"
  homepage "https://github.com/calebcauthon/riff"
  url "https://github.com/calebcauthon/riff/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "d18cad994c29cf1b8160070e5c3430b8d82c485bd270e4f114beb923131fa738"
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

class Riff < Formula
  desc "Local-first voice notes and transcription CLI"
  homepage "https://github.com/calebcauthon/riff"
  url "https://github.com/calebcauthon/riff/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "3111f1e4f833993364405bc5e1937e319400aa6f3c69026e64e02fd2952dbbfa"
  head "https://github.com/calebcauthon/riff.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "riff ", shell_output("#{bin}/riff --version")
  end
end

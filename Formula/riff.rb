class Riff < Formula
  desc "Local-first voice notes and transcription CLI"
  homepage "https://github.com/calebcauthon/riff"
  url "https://github.com/calebcauthon/riff/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "ad1be183fbc500d69d676fbfd2ad549cf040cafc5f1c8f0856e8f93b7df9142e"
  head "https://github.com/calebcauthon/riff.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "riff ", shell_output("#{bin}/riff --version")
  end
end

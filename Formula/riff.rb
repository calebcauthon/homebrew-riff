class Riff < Formula
  desc "Local-first voice notes and transcription CLI"
  homepage "https://github.com/calebcauthon/riff"
  url "https://github.com/calebcauthon/riff/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "b2b6020e99c46125934f33053bf44d9b3d2c3565975296f20bd0b82700b7ddd9"
  head "https://github.com/calebcauthon/riff.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "riff ", shell_output("#{bin}/riff --version")
  end
end

class Riff < Formula
  desc "Local-first voice notes and transcription CLI"
  homepage "https://github.com/calebcauthon/riff"
  url "https://github.com/calebcauthon/riff/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "cb82b36fa43ef4a4e691b51344a6d63715c9440629f36a820af3a5e80b003b98"
  head "https://github.com/calebcauthon/riff.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "riff ", shell_output("#{bin}/riff --version")
  end
end

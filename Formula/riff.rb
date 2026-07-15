class Riff < Formula
  desc "Local-first voice notes and transcription CLI"
  homepage "https://github.com/calebcauthon/riff"
  url "https://github.com/calebcauthon/riff/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "9fc9c17cdcc3717bdfd9ed5b944e2bd798683344a1a4b8ec231b59fdb3aeb48c"
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

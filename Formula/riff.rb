class Riff < Formula
  desc "Local-first voice notes and transcription CLI"
  homepage "https://github.com/calebcauthon/riff"
  url "https://github.com/calebcauthon/riff/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "c233e533e817faef716c6a0c1c7339b975297a790b856bba95d21553ec235487"
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

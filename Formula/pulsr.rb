# Written by scripts/update-formula.sh; changes made here by hand are lost
# at the next release.
class Pulsr < Formula
  desc "Ridge visualiser in the terminal for whatever the computer is playing"
  homepage "https://github.com/1337raspberry/pulsr"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.2/pulsr-0.1.2-macos-apple-silicon.tar.gz"
      sha256 "fb3456c7d305ac2d373601c9eb3e0ae5bf2a4035444625aee94bf5e7b27baa26"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.2/pulsr-0.1.2-linux-x86_64.tar.gz"
      sha256 "5568c70ed15c408927b166c7a59625c3fecf933606e0efd3ea023c9eb8af5e5a"
    end
    on_arm do
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.2/pulsr-0.1.2-linux-arm64.tar.gz"
      sha256 "81c52a034c9b83140520b41d0f3d12cc30c648cf748ae6c8b5fd44c669fc0ab7"
    end
  end

  def install
    bin.install "pulsr"
  end

  test do
    assert_match "pulsr [options]", shell_output("#{bin}/pulsr -help 2>&1")
  end
end

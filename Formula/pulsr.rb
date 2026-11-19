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
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.0/pulsr-0.1.0-macos-apple-silicon.tar.gz"
      sha256 "f1b2be2dabe2ce7afab31c6d2fc148898ab2b9edd36c534d489e47eb395c0d8a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.0/pulsr-0.1.0-linux-x86_64.tar.gz"
      sha256 "9218629cf3aee49890ff6a71dd2e4ebe8eb510a747e4966a3526c15c6d374a38"
    end
    on_arm do
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.0/pulsr-0.1.0-linux-arm64.tar.gz"
      sha256 "d77bc45aa21cf1bb6d6d480d57b0473833115046d029a9ec8a44fe7275161893"
    end
  end

  def install
    bin.install "pulsr"
  end

  test do
    assert_match "pulsr [options]", shell_output("#{bin}/pulsr -help 2>&1")
  end
end

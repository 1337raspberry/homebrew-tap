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
      sha256 "5177dc3275b443ccc59b30147b249b4ad795ed7dc6e2517955021837a5a48325"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.0/pulsr-0.1.0-linux-x86_64.tar.gz"
      sha256 "193b60631089ba768e8a655419888965be53e2a73f8cea2b85200cb3318b3a2d"
    end
    on_arm do
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.0/pulsr-0.1.0-linux-arm64.tar.gz"
      sha256 "e304c22bc73cec2ee41e8414448a223fbdab3912a63dce73048f466de522abd0"
    end
  end

  def install
    bin.install "pulsr"
  end

  test do
    assert_match "pulsr [options]", shell_output("#{bin}/pulsr -help 2>&1")
  end
end

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
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.3/pulsr-0.1.3-macos-apple-silicon.tar.gz"
      sha256 "374798fc6aee50e74dd6e3b65144756420f8f6cce78f9d494170f5be4771601a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.3/pulsr-0.1.3-linux-x86_64.tar.gz"
      sha256 "40433abdfc9eea02e347316628121979319898d74c46bfaea55073f14862d5f5"
    end
    on_arm do
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.3/pulsr-0.1.3-linux-arm64.tar.gz"
      sha256 "8a9642c96924377b029cccd114c4b0bc2cb084d09ffb9b9d5485475ab2ef6718"
    end
  end

  def install
    bin.install "pulsr"
  end

  test do
    assert_match "pulsr [options]", shell_output("#{bin}/pulsr -help 2>&1")
  end
end

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
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.1/pulsr-0.1.1-macos-apple-silicon.tar.gz"
      sha256 "e667252e363c60902c4bb5386bbc1c1f0edcde79085fa644e161b049f40425e6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.1/pulsr-0.1.1-linux-x86_64.tar.gz"
      sha256 "4da427457cd3a35bbdc3735df8a520fd93b89b684dda231fbc6c97de4dce070f"
    end
    on_arm do
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.1/pulsr-0.1.1-linux-arm64.tar.gz"
      sha256 "65950189e037c5a9039c6b8d426b8ef54cb63cb47760f620b2ffddf577eaf3a1"
    end
  end

  def install
    bin.install "pulsr"
  end

  test do
    assert_match "pulsr [options]", shell_output("#{bin}/pulsr -help 2>&1")
  end
end

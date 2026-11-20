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
      sha256 "1abeab199ac099d0cc42726ef688ec9ac5dd6978fce93c487c34ef1480b2bb68"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.2/pulsr-0.1.2-linux-x86_64.tar.gz"
      sha256 "ad0941e4615e1731e353dc693309054073b4aad3dd540d30075943b161b9a57c"
    end
    on_arm do
      url "https://github.com/1337raspberry/pulsr/releases/download/v0.1.2/pulsr-0.1.2-linux-arm64.tar.gz"
      sha256 "994b4030aefab990634bc39b6274a59caf002bdbad754a18cadb96cacd31fb24"
    end
  end

  def install
    bin.install "pulsr"
  end

  test do
    assert_match "pulsr [options]", shell_output("#{bin}/pulsr -help 2>&1")
  end
end

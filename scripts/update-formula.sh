#!/bin/sh
# Writes Formula/pulsr.rb for a published release of pulsr.
#
#   scripts/update-formula.sh 0.2.0
#
# The hashes are read from the .sha256 files attached to the release, so
# the release has to be there first. Needs the GitHub CLI.

set -eu

if [ $# -ne 1 ]; then
  echo "usage: $0 VERSION" >&2
  exit 2
fi

version=${1#v}
repo=1337raspberry/pulsr
root=$(cd "$(dirname "$0")/.." && pwd)

sums=$(mktemp -d)
trap 'rm -rf "$sums"' EXIT
gh release download "v$version" --repo "$repo" --pattern '*.sha256' --dir "$sums"

# The hash recorded for one platform's archive.
hash() {
  file="$sums/pulsr-$version-$1.tar.gz.sha256"
  if [ ! -f "$file" ]; then
    echo "release v$version has no archive for $1" >&2
    exit 1
  fi
  sum=$(cut -d ' ' -f 1 "$file")
  if ! printf '%s' "$sum" | grep -Eq '^[0-9a-f]{64}$'; then
    echo "$file does not hold a SHA-256 hash" >&2
    exit 1
  fi
  printf '%s' "$sum"
}

macos_arm=$(hash macos-apple-silicon)
linux_intel=$(hash linux-x86_64)
linux_arm=$(hash linux-arm64)

mkdir -p "$root/Formula"
cat > "$root/Formula/pulsr.rb" <<FORMULA
# Written by scripts/update-formula.sh; changes made here by hand are lost
# at the next release.
class Pulsr < Formula
  desc "Ridge visualiser in the terminal for whatever the computer is playing"
  homepage "https://github.com/$repo"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/$repo/releases/download/v$version/pulsr-$version-macos-apple-silicon.tar.gz"
      sha256 "$macos_arm"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/$repo/releases/download/v$version/pulsr-$version-linux-x86_64.tar.gz"
      sha256 "$linux_intel"
    end
    on_arm do
      url "https://github.com/$repo/releases/download/v$version/pulsr-$version-linux-arm64.tar.gz"
      sha256 "$linux_arm"
    end
  end

  def install
    bin.install "pulsr"
  end

  test do
    assert_match "pulsr [options]", shell_output("#{bin}/pulsr -help 2>&1")
  end
end
FORMULA

echo "Formula/pulsr.rb is now $version"

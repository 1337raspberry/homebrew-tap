# homebrew-tap

Homebrew tap for [pulsr](https://github.com/1337raspberry/pulsr), a ridge
visualiser in the terminal for whatever the computer is playing. For macOS
on Apple Silicon and for Linux on x86_64 and arm64.

## Install

```bash
brew install 1337raspberry/tap/pulsr
```

## Update

```bash
brew upgrade pulsr
```

## Releasing

The formula installs the archives attached to a pulsr release, so it is
updated after the release is published:

```bash
gh workflow run update.yml -R 1337raspberry/homebrew-tap -f version=0.2.0
```

That runs `scripts/update-formula.sh`, which reads the hashes from the
release and writes `Formula/pulsr.rb`, and commits the result. The script
can be run from a checkout as well.

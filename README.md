# AUR: arangodb-latest

An Arch Linux AUR package for ArangoDB

## Installation

```shell
yaourt -S arangodb-latest
```

### Pre-built package

Compilation from the sources takes very long time.
If you can't wait, find a pre-built package for `x86_64` in [Releases](https://github.com/asaaki/AUR-arangodb-latest/releases) and install with:

```shell
yaourt -U arangodb-latest-<version>-x86_64.pkg.tar.xz
```

## Run

```shell
sudo systemctl enable arangodb.service
sudo systemctl start arangodb.service
```

# Maintainer: Christoph Grabo <asaaki@mannaz.cc>
#
# based on:
# - https://aur.archlinux.org/packages/arangodb
# - https://aur.archlinux.org/packages/arangodb-git

pkgname=arangodb-latest
pkgver=2.3.0
pkgrel=5
pkgdesc="A distributed open-source database with a flexible data model for documents, graphs, and key-values."
provides=("arangodb")
conflicts=("arangodb" "arangodb-git")

arch=("i686" "x86_64")
url="https://www.arangodb.com/"
license=("Apache")
depends=("openssl" "readline" "systemd")
makedepends=("go" "python2")
install=arangodb.install
source=(  "https://www.arangodb.com/repositories/Source/ArangoDB-2.3.0.tar.bz2"
          "arangodb.service")
md5sums=( "ff6f86b6924206de020a54779ea25180"
          "3cdd43ed5552ab918b41627ec4906e52")

build() {
  ln -s -f /usr/bin/python2 python
  export PATH="`pwd`:$PATH"

  cd $srcdir/ArangoDB-$pkgver
  ./configure \
    --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var \
    --enable-all-in-one-v8 --enable-all-in-one-libev --enable-all-in-one-icu
  make
}

check() {
  cd $srcdir/ArangoDB-$pkgver
  make -k check
}

package() {
  cd $srcdir/ArangoDB-$pkgver
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/share/doc/arangodb
  cp -R $srcdir/ArangoDB-$pkgver/Documentation/* $pkgdir/usr/share/doc/arangodb/

  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $srcdir/arangodb.service $pkgdir/usr/lib/systemd/system/
}

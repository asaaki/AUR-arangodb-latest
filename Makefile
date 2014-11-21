PKG_NAME=arangodb-latest
PKG_SUFFIX=.pkg.tar.xz

all: clean build check package

build:
	@makepkg

check:
	@namcap PKGBUILD
	@find . -name $(PKG_NAME)-*$(PKG_SUFFIX) -exec namcap {} \;

package:
	@mkaurball

install:
	@find . -name $(PKG_NAME)-*$(PKG_SUFFIX) -exec sudo pacman -U {} \;

checksum:
	@md5sum arangodb.service
	@find . -maxdepth 1 -name "*.tar.{gz,bz2}" -exec md5sum {} \;

clean:
	@rm -rf *.xz *.gz pkg src

.PHONY: all build check checksum clean install package

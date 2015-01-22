PKG_NAME=arangodb-latest
PKG_SUFFIX=.pkg.tar.xz

all: clean build check package

build:
	makepkg -c -s

# NEEDS: pacman -S namcap
check:
	@namcap PKGBUILD
	@find . -name $(PKG_NAME)-*$(PKG_SUFFIX) -exec namcap {} \;

package:
	@makepkg --source

install:
	@find . -name $(PKG_NAME)-*$(PKG_SUFFIX) -exec sudo pacman -U {} \;

checksum:
	updpkgsums

clean:
	@rm -rf *.bz2 *.gz *.xz *.part pkg src

.PHONY: all build check checksum clean install package

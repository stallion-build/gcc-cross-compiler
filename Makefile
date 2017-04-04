TARGET=i686-elf
# export PATH="$(PREFIX)/bin:$PATH"

all: binutils gcc
	echo "Build complete!"

binutils:
	echo "Building Binutils..."
	mkdir -p src/build-binutils;
	cd src/build-binutils && ../binutils-2.28/configure --target=$(TARGET) --with-sysroot --disable-nls --disable-werror;
	cd src/build-binutils && make
	cd src/build-binutils && make install

gcc:
	echo "Building GCC..."
	mkdir -p cd src/build-gcc
	cd src/build-gcc && ../gcc-x.y.z/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
	cd src/build-gcc && make all-gcc
	cd src/build-gcc && make all-target-libgcc
	cd src/build-gcc && make install-gcc
	cd src/build-gcc && make install-target-libgcc

clean:
	rm -rf src

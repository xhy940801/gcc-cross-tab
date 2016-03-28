class GccCross < Formula
  desc "GCC elf Cross"
  url "http://gcc.parentingamerica.com/releases/gcc-5.3.0/gcc-5.3.0.tar.bz2"
  sha256 "b84f5592e9218b73dbae612b5253035a7b34a9a1f7688d2e1bfaaf7267d5c4db"

  depends_on "mpfr"
  depends_on "gmp"
  depends_on "libmpc"
  depends_on "gcc"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "CC=gcc-5",
                          "CXX=g++-5",
                          "CPP=cpp-5",
                          "LD=gcc-5",
                          "--program-suffix=-i686-elf-cross",
                          "--target=i686-elf",
                          "--disable-nls",
                          "--enable-languages=c,c++",
                          "--without-headers"
    system "make", "all-gcc"
    system "make", "all-target-libgcc"
    system "make", "install-gcc"
    system "make", "install-target-libgcc"
  end
end

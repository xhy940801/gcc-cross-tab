class BinutilsCross < Formula
  desc "Binutils elf Cross"
  url "http://ftp.gnu.org/gnu/binutils/binutils-2.26.tar.gz"
  sha256 "9615feddaeedc214d1a1ecd77b6697449c952eab69d79ab2125ea050e944bcc1"

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
                          "--disable-werror"
    system "make"
    system "make", "install"
  end
end

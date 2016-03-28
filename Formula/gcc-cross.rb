class GccCross < Formula
  desc "GCC elf Cross"
  url "http://gcc.parentingamerica.com/releases/gcc-5.3.0/gcc-5.3.0.tar.bz2"
  sha256 "b84f5592e9218b73dbae612b5253035a7b34a9a1f7688d2e1bfaaf7267d5c4db"

  depends_on "mpfr"
  depends_on "gmp"
  depends_on "libmpc"
  depends_on "binutils-cross"

  def install
    mkdir "build" do
      ENV["PATH"] = "#{Formula["binutils-cross"].bin}:#{HOMEBREW_PREFIX}:" + ENV["PATH"]
      system "../configure", "--prefix=#{prefix}",
                             "--target=i686-elf",
                             "--disable-nls",
                             "--enable-languages=c,c++",
                             "--enable-multilib",
                             "--enable-interwork",
                             "--without-headers",
                             "--with-gmp=#{Formula["gmp"].opt_prefix}",
                             "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
                             "--with-mpc=#{Formula["libmpc"].opt_prefix}"
      system "make", "all-gcc"
      system "make", "all-target-libgcc"
      system "make", "install-gcc"
      system "make", "install-target-libgcc"
    end
  end
end

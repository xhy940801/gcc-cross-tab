class Bochs < Formula
  desc "Binutils elf Cross"
  url "http://ufpr.dl.sourceforge.net/project/bochs/bochs/2.6.8/bochs-2.6.8.tar.gz"
  sha256 "79700ef0914a0973f62d9908ff700ef7def62d4a28ed5de418ef61f3576585ce"

  depends_on "sdl2"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--enable-ne2000",
                          "--enable-all-optimizations",
                          "--enable-cpu-level=6",
                          "--enable-x86-64",
                          "--enable-vmx=2",
                          "--enable-pci",
                          "--enable-usb",
                          "--enable-usb-ohci",
                          "--enable-e1000",
                          "--enable-debugger",
                          "--enable-disasm",
                          "--disable-debugger-gui",
                          "--with-sdl2"
    system "make"
    system "make", "install"
  end
end

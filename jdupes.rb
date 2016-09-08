class Jdupes < Formula
  desc "Powerful duplicate file finder and an enhanced fork of 'fdupes'."
  homepage "https://github.com/jbruchon/jdupes/"
  url "https://github.com/jbruchon/jdupes/archive/v1.4.tar.gz"
  sha256 "042a361c9d212e02b00e203ce3c23925897450a9b69112a066305c9d9870e67e"

  head "https://github.com/jbruchon/jdupes.git"

  def install
    inreplace "Makefile", "/usr/local", HOMEBREW_PREFIX
    system "make"
    bin.install "jdupes"
    man1.install "jdupes.1"
  end

  test do
    touch "a"
    touch "b"

    dupes = shell_output("#{bin}/fdupes .").strip.split("\n").sort
    assert_equal ["./a", "./b"], dupes
  end
end

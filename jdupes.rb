class Jdupes < Formula
  desc "Powerful duplicate file finder and an enhanced fork of 'fdupes'"
  homepage "https://github.com/jbruchon/jdupes/"
  url "https://github.com/jbruchon/jdupes/archive/v1.9.tar.gz"
  sha256 "7f2505571c9fc8f76609b918106785f61e4a85af184309f738d7d847f1c2a1cf"

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
    (testpath/"c").write("unique file")

    dupes = shell_output("#{bin}/jdupes --zeromatch .").strip.split("\n").sort

    assert_equal ["./a", "./b"], dupes
    assert_equal dupes.include?("c"), false
  end
end

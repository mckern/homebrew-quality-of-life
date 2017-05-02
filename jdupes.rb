class Jdupes < Formula
  desc "Powerful duplicate file finder and an enhanced fork of 'fdupes'."
  homepage "https://github.com/jbruchon/jdupes/"
  url "https://github.com/jbruchon/jdupes/archive/v1.8.tar.gz"
  sha256 "f2ba7cfecbc77cb2c43ec490994f3363754b6a84d6a5ca9728a2c33601acd6a0"

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

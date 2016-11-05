class Jdupes < Formula
  desc "Powerful duplicate file finder and an enhanced fork of 'fdupes'."
  homepage "https://github.com/jbruchon/jdupes/"
  url "https://github.com/jbruchon/jdupes/archive/v1.5.1.tar.gz"
  sha256 "5159a79f7c2ff814def9759b993040271023ea095f98a0cb3374d53555df127d"

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

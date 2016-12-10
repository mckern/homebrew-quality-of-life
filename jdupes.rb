class Jdupes < Formula
  desc "Powerful duplicate file finder and an enhanced fork of 'fdupes'."
  homepage "https://github.com/jbruchon/jdupes/"
  url "https://github.com/jbruchon/jdupes/archive/v1.6.2.tar.gz"
  sha256 "efab2f07e41c072c63ca3d5a7ced9e516990e544de29665501c986cf34ceb9c5"

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

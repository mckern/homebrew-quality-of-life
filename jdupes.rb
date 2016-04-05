class Jdupes < Formula
  desc "Powerful duplicate file finder and an enhanced fork of 'fdupes'."
  homepage "https://github.com/jbruchon/jdupes/"
  url "https://github.com/jbruchon/jdupes/archive/v1.2.1.tar.gz"
  sha256 "4935944c24cd73247e1f0464c6149ae2bb5329d57eafb89831288f79ee0854a5"

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

class Symlinks < Formula
  desc "Fix, alter, manage symlinks."
  homepage "https://github.com/mckern/symlinks/"

  head "https://github.com/mckern/symlinks.git"

  def install
    system "make", "PREFIX=#{prefix}"
    bin.install "symlinks"
    man8.install "symlinks.8"
  end
end

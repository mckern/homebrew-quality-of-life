class Symlinks < Formula
  desc "Fix, alter, manage symlinks."
  homepage "https://github.com/cometsong/symlinks/"

  head "https://github.com/cometsong/symlinks.git"

  def install
    system "make", "PREFIX=#{prefix}"
    bin.install "symlinks"
    man8.install "symlinks.8"
  end

  test do
    # $ symlinks -d -v .
    # dangling: /Users/mckern/Documents/Repositories/homebrew-quality-of-life/b -> a (reason: No such file or directory)
    # deleted:  /Users/mckern/Documents/Repositories/homebrew-quality-of-life/b -> a

    ln_s "a", "b"
    assert_match "b -> a (reason: No such file or directory)", shell_output("symlinks -d .")
  end
end

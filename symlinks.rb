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
    ln_s "a", "b"
    
    assert_match "b -> a (reason: No such file or directory)",
      shell_output("#{bin}/symlinks -d .")
  end
end

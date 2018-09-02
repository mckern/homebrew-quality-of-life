class Symlinks < Formula
  desc "Fix, alter, manage symlinks"
  homepage "https://github.com/cometsong/symlinks/"

  url "https://github.com/cometsong/symlinks.git",
      :revision => "4c01a15f8cc3de9bcb31e0cbabcbfb6af33b4aae"
  version "4c01a15f"

  bottle :unneeded

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

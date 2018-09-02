class InvertedCommas < Formula
  desc "Plaintext filter to strip smart quotes"
  homepage "https://github.com/mckern/inverted-commas"

  url "https://github.com/mckern/inverted-commas.git",
    :revision => "v0.0.3"
  version "0.0.3"

  bottle :unneeded

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/github.com/mckern/inverted-commas"
    dir.install buildpath.children

    cd dir do
      system "dep", "ensure", "-vendor-only"
      system "go", "build", "-o", "ic"
      bin.install "ic"
    end
  end

  test do
    assert_equal %q("This was some fancy text", wasn't it?), pipe_output("#{bin}/ic", "‟This was some fancy text”, wasn’t it?", 0).chomp
  end
end

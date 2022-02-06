# frozen_string_literal: true

class Yaml2json < Formula
  desc "Command-line tool to convert yaml to json"
  homepage "https://github.com/bronze1man/yaml2json"

  url "https://github.com/bronze1man/yaml2json/archive/refs/tags/v1.3.tar.gz"
  sha256 "fd0954936fef9f4848ef37debb25b26479495df0a8d46582e1e307cb29cdafc1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath / "src/github.com/bronze1man/yaml2json"
    dir.install buildpath.children

    cd dir do
      system "go", "build", "-o", "yaml2json"
      bin.install "yaml2json"
    end
  end

  test do
    assert_equal '{"key":"cat"}', pipe_output("#{bin}/yaml2json", "key: cat", 0).chomp
  end
end

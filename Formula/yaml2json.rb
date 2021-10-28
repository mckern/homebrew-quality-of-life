# frozen_string_literal: true

class Yaml2json < Formula
  desc 'Command-line tool to convert yaml to json'
  homepage 'https://github.com/bronze1man/yaml2json'

  url 'https://github.com/bronze1man/yaml2json.git',
      revision: '80f2764d2ec35464f8b88f9caaae520b2fdc3b88'
  version '80f2764d'

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    dir = buildpath / 'src/github.com/bronze1man/yaml2json'
    dir.install buildpath.children

    cd dir do
      system 'go', 'build', '-o', 'yaml2json'
      bin.install 'yaml2json'
    end
  end

  test do
    assert_equal '{"key":"cat"}', pipe_output("#{bin}/yaml2json", 'key: cat', 0).chomp
  end
end

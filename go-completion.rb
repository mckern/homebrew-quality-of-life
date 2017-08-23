class GoCompletion < Formula
  desc "Bash and Zsh completion for Go CLI"
  homepage "https://github.com/kura/go-bash-completion"
  url "https://github.com/kura/go-bash-completion.git",
    :revision => "26c2a2314ea1d2acbe503f88d994080fae46641b"
  version "26c2a231"

  head "https://github.com/kura/go-bash-completion.git"

  bottle :unneeded

  def install
    bash_completion.install "etc/bash_completion.d/go" => "go"
  end

  test do
    assert_match "-F _go",
      shell_output("source #{bash_completion}/go && complete -p go")
  end
end

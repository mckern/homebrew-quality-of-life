class GoCompletion < Formula
  desc "Bash and Zsh completion for Go CLI"
  homepage "https://github.com/kura/go-bash-completion"

  url "https://github.com/kura/go-bash-completion.git",
      :revision => "c86abfa41d2df9eede3d45e98d278dc12c004a7e"
  version "c86abfa4"

  bottle :unneeded

  def install
    bash_completion.install "etc/bash_completion.d/go" => "go"
  end

  test do
    assert_match "-F _go",
      shell_output("source #{bash_completion}/go && complete -p go")
  end
end

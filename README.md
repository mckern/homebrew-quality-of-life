# Quality of Life
## A Homebrew tap that shaves off some rough edges

Some handy [Homebrew](https://brew.sh/) formulas for useful tools that may not be accepted upstream (either because they're based on forks or mirrors, or because they're not deemed to be notable enough).

<!-- MarkdownTOC -->

- [What's provided?](#whats-provided)
- [Usage](#usage)
- [Support & contribution?](#support--contribution)
- [License](#license)
- [Maintainer](#maintainer)

<!-- /MarkdownTOC -->

## What's provided?

* [go-completion](https://github.com/kura/go-bash-completion): Bash and Zsh completion for `go` CLI
* [jdupes](https://github.com/jbruchon/jdupes/): Powerful duplicate file finder; an enhanced fork of `fdupes`
* [symlinks](https://github.com/cometsong/symlinks/): Fix, alter, manage symlinks with more refinement than `ln`
    - This formula is currently head-only since it's a fork with patches that are missing from the [upstream source](https://github.com/brandt/symlinks); Install it by running
        ```
        $ brew install --HEAD symlinks
        ```
* [syn](https://github.com/stephencelis/syn): Natural language processing tool for plaintext

## Usage

```
$ brew tap mckern/quality-of-life
```

## Support & contribution?

All formula within homebrew-quality-of-life are provided "as is", without warranty of any kind, express or implied. If you find a bug or a problem, please open an issue or a pull request.

## License

The formulas in homebrew-quality-of-life are licensed under the Apache License, Version 2.0.

The software installed by these formula are licensed under their respective upstream licenses.

> "When in doubt, use brute force."
>    &#8213; <cite>Ken Thompson</cite>

## Maintainer

Ryan McKern &lt;ryan@orangefort.com&gt;

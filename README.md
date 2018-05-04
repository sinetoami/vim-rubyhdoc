# vim-rubyhdoc

I wanted a way to turn on syntax highlight in ruby **HereDoc** for another languages like _HTML_ and _SQL_. I found a [way][1] to do that. The [another way][2] give me inspiration to make my own plugin.
I like to find simple ways to do stuffs, and I believe that this plugin is a simple way to do what I want.

> Work in progress

## Instalation

Use your favorite plugin manager, or try [dein.vim](https://github.com/Shougo/dein.vim).

### With dein.vim

Install [dein.vim](https://github.com/Shougo/dein.vim), and add the following line to your `~/.vimrc`:

    call dein#add('sinetoami/vim-rubyhdoc')

And then execute the following command on to your Vim:

    :call dein#install()

### Manually

If you are not using a package manager, download manually the [zip](https://github.com/sinetoami/vim-rubyhdoc/archive/master.zip) repo and extract the files to `~/.vim`:

    $ cp vim-rubyhdoc-master.zip ~/.vim
    $ cd ~/.vim
    $ unzip vim-rubyhdoc-master.zip -d /destination/plugins/folder
    $ rm vim-rubyhdoc-master.zip

## Usage

### g:rubyhdoc_filetypes
  
  `let g:rubyhdoc_filetypes = { "sql" : "syntax/mysql" }`

This variable receive a dictionary in a form of `{ "filetype" : "path-to-file/filename" }`
- _filetype_ will receive a filetype
- _path-to-file_ will receive a path to file with the _filename_ without the extension
  - It's possible to ignore the `path-to-file/filename` value. This behavior will set the default Vim syntax highlight to the specific `filetype` key
    
    ```vim
    let g:rubyhdoc_filetypes = {
    \ "html" : "",
    \ "sql"  : "syntax/pgsql"
    \}
    ```

    - This above example set default syntax highlight for _HTML_ filetype and set the `pgsql` syntax highlight for _SQL_ filetype

## Self-Promotion

Do you like this plugin? Come on:
- Star and follow the repository on [GitHub](https://github.com/sinetoami/vim-rbrun).
- Follow me on
  - [GitHub](https://github.com/sinetoami)

## License

Distributed under the terms of the Vim license.
See `:help license`.

[1]:https://subvisual.co/blog/post/87-smarter-heredoc-syntax-in-vim
[2]:https://github.com/joker1007/vim-ruby-heredoc-syntax

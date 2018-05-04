" =============================================================================
" Plugin Name: vim-rubyhdoc
" Author:      Sinésio 'sineto' Neto <sinetoami [at] gmail [dot] com>
" Version:     0.0.1 - 2018 May 03
" License:     Distributed under the terms of the Vim license.
" Description: Smart ruby here document syntax highlight in Vim.
" =============================================================================

if exists('g:loaded_rubyhdoc')
  finish
endif
let g:loaded_rubyhdoc = 1

let s:save_cpo = &cpo
set cpo&vim


if !exists('g:rubyhdoc_filetypes')
  let g:rubyhdoc_filetypes = {}
endif

function! s:enable_rubyhdoc_syntax()
  for [filetype, pathfile] in items(g:rubyhdoc_filetypes)
    if pathfile == ''
       let pathfile = 'syntax/' . filetype
    endif

    call rubyhdoc#include_syntax(filetype, pathfile)
    call rubyhdoc#enable_highlight(filetype)
  endfor
endfunction

augroup rubyhdoc
  autocmd!
  autocmd Syntax ruby call s:enable_rubyhdoc_syntax()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo

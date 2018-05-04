" =============================================================================
" Plugin Name: vim-rubyhdoc
" Author:      Sinésio 'sineto' Neto <sinetoami [at] gmail [dot] com>
" Version:     0.0.1 - 2018 May 03
" License:     Distributed under the terms of the Vim license.
" Description: Smart ruby here document syntax highlight in Vim.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! s:sql_checker(filetype)
  if index(['sql', 'pgsql', 'mysql'], a:filetype) != -1
    return 1
  endif
  return 0
endfunction

function! s:str_delimiter(filetype)
  if s:sql_checker(a:filetype)
    return '[PG|MY]*SQL'
  else
  return toupper(a:filetype)
endfunction

function! s:syntax_group(filetype)
  let ft = toupper(a:filetype)
  return 'rubyHereDoc' . ft
endfunction

function! rubyhdoc#include_syntax(filetype, pathfile)
  if exists('b:current_syntax')
    let s:bcs = b:current_syntax
    unlet b:current_syntax
  endif

  exec 'syntax include @' . a:filetype . ' ' . a:pathfile . '.vim'

  if exists('s:bcs')
    let b:current_syntax = s:bcs
  else
    unlet b:current_syntax
  endif
endfunction

function rubyhdoc#enable_highlight(filetype)
  let region_group = s:syntax_group(a:filetype)
  let str_delim = s:str_delimiter(a:filetype)
  let regexp = "<<[-~.]*\\z(" . str_delim . "[A-Z_]*\\)"

  exec 'syntax region ' . region_group .  ' matchgroup=rubyStringDelimiter start=+' . regexp . '+ end=+^\s*\z1+ contains=@' . a:filetype . ',rubyInterpolation'
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

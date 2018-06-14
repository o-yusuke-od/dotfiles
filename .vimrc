let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

autocmd vimenter * syntax on
  call dein#begin(s:dein_dir)
  let g:rc_dir    = expand('~/dotfiles/vim/etc/modules/')
  let s:toml      = g:rc_dir . '/dein.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
if dein#check_install()
  call dein#install()
endif

for file in split(glob('~/dotfiles/vim/etc/**/*.vim'), '\n')
    exe 'source' file
endfor

for script in split(glob('~/dotfiles/vim/src/*.vim'), '\n')
    exe 'source' script
endfor

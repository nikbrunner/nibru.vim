source    $HOME/.config/nvim/general/sets.vim
source    $HOME/.config/nvim/general/plugins.vim

" vim plugins
source    $HOME/.config/nvim/plug-config/highlightedyank.vim
source    $HOME/.config/nvim/plug-config/pencil.vim
source    $HOME/.config/nvim/plug-config/startify.vim
source    $HOME/.config/nvim/plug-config/markdown-preview.vim
source    $HOME/.config/nvim/plug-config/gitignore.vim
source    $HOME/.config/nvim/plug-config/lazygit.vim
source    $HOME/.config/nvim/plug-config/nvimtree.vim
source    $HOME/.config/nvim/plug-config/peekup.vim
source    $HOME/.config/nvim/plug-config/emmet.vim
source    $HOME/.config/nvim/plug-config/ultisnips.vim

" lua plugins
luafile   $HOME/.config/nvim/plug-config/treesitter.lua
luafile   $HOME/.config/nvim/plug-config/telescope.lua
luafile   $HOME/.config/nvim/plug-config/galaxyline.lua
luafile   $HOME/.config/nvim/plug-config/gitsigns.lua
luafile   $HOME/.config/nvim/plug-config/compe.lua
luafile   $HOME/.config/nvim/plug-config/trouble.lua
luafile   $HOME/.config/nvim/plug-config/autopairs.lua
luafile   $HOME/.config/nvim/plug-config/autotags.lua
luafile   $HOME/.config/nvim/plug-config/formatter.lua
luafile   $HOME/.config/nvim/plug-config/rooter.lua
luafile   $HOME/.config/nvim/plug-config/zen-mode.lua
luafile   $HOME/.config/nvim/plug-config/github-nvim.lua
luafile   $HOME/.config/nvim/plug-config/colorizer.lua

" lsp 
luafile   $HOME/.config/nvim/plug-config/lsp/ts.lua
luafile   $HOME/.config/nvim/plug-config/lsp/css.lua
luafile   $HOME/.config/nvim/plug-config/lsp/bash.lua
luafile   $HOME/.config/nvim/plug-config/lsp/lspsaga.lua

" mappings and settings
source    $HOME/.config/nvim/general/autocmd.vim
source    $HOME/.config/nvim/general/spellcheck.vim
source    $HOME/.config/nvim/general/quickfix.vim
luafile   $HOME/.config/nvim/general/mappings.lua

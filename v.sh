#!/bin/sh
rm -rf ~/.config/nvim-NvChad/lua/custom

ln -vsf ~/REPOS/editors/nvim-NvChad/lua/custom ~/.config/nvim-NvChad/lua
ln -vsf ~/REPOS/editors/tex ~/git/editors/nvim-NvChad/lua/custom/

rm -rf ~/.config/nvim ~/.local/state/nvim ~/.local/share/nvim ~/.cache/nvim

ln -svf ~/.config/nvim-NvChad ~/.config/nvim
ln -svf ~/.local/share/nvim-NvChad ~/.local/share/nvim
ln -svf ~/.local/state/nvim-NvChad ~/.local/state/nvim
ln -svf ~/.cache/nvim-NvChad ~/.cache/nvim

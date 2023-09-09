#!/bin/sh
rm -rf ~/.config/nvim-NvChad/lua/custom

ln -vsf ~/REPOS/re_viser/nvim-NvChad/lua/custom ~/.config/nvim-NvChad/lua
ln -vsf ~/REPOS/re_viser/tex ~/REPOS/re_viser/nvim-NvChad/lua/custom/

ln -svf ~/REPOS/re_viser/lvim ~/.config/

rm -rf ~/.config/nvim ~/.local/state/nvim ~/.local/share/nvim

ln -svf ~/.config/nvim-NvChad ~/.config/nvim
ln -svf ~/.local/share/nvim-NvChad ~/.local/share/nvim
ln -svf ~/.local/state/nvim-NvChad ~/.local/state/nvim

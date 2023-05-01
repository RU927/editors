#!/bin/bash

function backup_configs {
	echo -e "\u001b[33;1m Backing up existing files... \u001b[0m"
	# mv -iv ~/.config/    ~/.config/
	# mv -iv ~/.config/    ~/.config/
	# mv -iv ~/.config/    ~/.config/
	# mv -iv ~/.config/    ~/.config/

	# mv -iv ~/.            ~/.
	# mv -iv ~/.            ~/.
	# mv -iv ~/.            ~/.
	echo -e "\u001b[36;1m Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old'. \u001b[0m"
}

## -f удаляет имеющийся линк
function setup_symlinks {
	echo -e "\u001b[7m Setting up symlinks... \u001b[0m"
	mkdir -p ~/.config
	# ln -sfnv "$PWD/config/nvim/"          ~/.config/
	ln -sfnv "$PWD/config/lazygit/" ~/.config/
	ln -sfnv "$PWD/config/sheldon/" ~/.config/
	ln -sfnv "$PWD/config/greenclip.cfg" ~/.config/
	ln -sfnv "$PWD/config/greenclip.toml" ~/.config/

	# ln -sfnv "$PWD/"                ~/.
	# ln -sfnv "$PWD/"                ~/.
	# ln -sfnv "$PWD/"                ~/.
	# ln -sfnv "$PWD/"                ~/.
	# ln -sfnv "$PWD/"                ~/.
}

function install_nodejs {
	echo -e "\u001b[7m Installing NodeJS... \u001b[0m"
	# nodejs
	sudo apt remove nodejs
	sudo apt autoremove
	curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
	sudo apt install -y nodejs
	node -v
	npm -v
}

function install_neovim {
	echo -e "\u001b[7m Installing depth... \u001b[0m"
	pip3 install pynvim
	pip3 install neovim-remote
	npm i -g neovim

	echo -e "\u001b[7m Installing nvim version managers... \u001b[0m"
	cargo install bob-nvim
	# bob use stable

	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 70

	echo -e "\u001b[7m Cloning repos... \u001b[0m"
	mkdir -p ~/git/editors
	git clone https://github.com/RU927/editors.git ~/git/editors

	# NvChad
	# git clone https://github.com/NvChad/NvChad ~/.config/NvChad --depth 1
	rm -rf ~/.config/nvim-NvChad/lua/custom
	ln -vsf ~/git/editors/nvim-NvChad/lua/custom ~/.config/nvim-NvChad/lua
	ln -vsf ~/git/editors/tex ~/git/editors/nvim-NvChad/lua/custom/

	rm -rf ~/.config/nvim ~/.local/state/nvim ~/.local/share/nvim
	ln -svf ~/.config/nvim-NvChad ~/.config/nvim
	ln -svf ~/.local/share/nvim-NvChad ~/.local/share/nvim
	ln -svf ~/.local/state/nvim-NvChad ~/.local/state/nvim

	# Lunarvim
	bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
	ln -svf ~/git/editors/lvim ~/.config/

	# AstroNvim
	rm -rf ~/.config/nvim-AstroNvim/lua/user/
	ln -vsf /home/ru/git/editors/AstroNvim/lua/user ~/.config/nvim-AstroNvim/lua
	# git remote add origin git@github.com:RU927/editors
	# ln -sfnv "~/git/editors/latex/"         ~/.config/
}

function install_latex {
	echo -e "\u001b[7m Installing latex \u001b[0m"
	sudo apt install texlive
	# sudo apt install texlive-latex-extra
	# sudo apt install texlive-full
	latexmk --version
}

function install_zotero_bibtex {
	echo -e "\u001b[7m Installing zotero  \u001b[0m"
	wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | sudo bash
	sudo apt update
	sudo apt install zotero
	# https://www.zotero.org/download/
	# tar -xvf Zotero*
	# sudo mv ~/Downloads/Zotero_linux-x86_64 /opt/zotero
	# cd /opt/zotero
	# sudo ./set_launcher_icon
	# sudo ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop

	echo -e "\u001b[7m Installing bibtex  \u001b[0m"
	BIBTEX_VERSION=$(curl -s "https://api.github.com/repos/retorquere/zotero-better-bibtex/releases/latest" |
		grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo zotero-better-bibtex${BIBTEX_VERSION}.xpi \
		"https://github.com/retorquere/zotero-better-bibtex/releases/download/v${BIBTEX_VERSION}\
          /zotero-better-bibtex-${BIBTEX_VERSION}.xpi"

	# mkdir -p ~/texmf/bibtex/bib
	# ln -svf "~/git/editors/latex/bst" ~/texmf/bibtex
}

function install_lazygit {
	echo -e "\u001b[7m Installing  \u001b[0m"
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" |
		grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_\
          ${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
	rm -rf lazygit.tar.gz
	lazygit --version
}

function all {
	echo -e "\u001b[7m Setting up Dotfiles... \u001b[0m"
	# install_packages
	backup_configs
	setup_symlinks
	install_nodejs
	install_neovim
	install_latex
	install_zotero_bibtex
	install_lazygit
	install_fonts
	echo -e "\u001b[7m Done! \u001b[0m"
}

if [ "$1" = "--all" -o "$1" = "-a" ]; then
	all
	exit 0
fi

# Menu TUI
echo -e "\u001b[32;1m Setting up Dotfiles...\u001b[0m"

echo -e " \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
echo -e "  \u001b[34;1m (a) ALL \u001b[0m"
echo -e "  \u001b[34;1m (1) neovim \u001b[0m"
echo -e "  \u001b[34;1m (2) node \u001b[0m"
echo -e "  \u001b[34;1m (3) latex \u001b[0m"
echo -e "  \u001b[34;1m (4) zotero \u001b[0m"
echo -e "  \u001b[34;1m (5) lazygit \u001b[0m"

echo -e "  \u001b[31;1m (*) Anything else to exit \u001b[0m"

echo -en "\u001b[32;1m ==> \u001b[0m"

read -r option

case $option in

"a")
	all
	;;

"b")
	backup_configs
	;;

"s")
	setup_symlinks
	;;

"1")
	install_neovim
	;;

"2")
	install_nodejs
	;;

"3")
	install_latex
	;;

"4")
	install_zotero_bibtex
	;;

"5")
	install_lazygit
	;;

*)
	echo -e "\u001b[31;1m Invalid option entered, Bye! \u001b[0m"
	exit 0
	;;
esac

exit 0

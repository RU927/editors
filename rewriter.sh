#!/bin/bash
# Fetch submodules
# git submodule update --init --recursive

RC='\e[0m'
RED='\e[31m'
YELLOW='\e[33m'
# GREEN='\e[32m'
# GREEN2='[32;1m'
# WHITE='[37;1m'
# BLUE='[34;1m'

RV='\u001b[7m'

THIS_REPO_PATH="$(dirname "$(realpath "$0")")"
# THIS_REPO_PATH=$HOME/REPOS/reinst
DOT_CFG_PATH=$THIS_REPO_PATH/config
# DOT_HOME_PATH=$THIS_REPO_PATH/home
USR_CFG_PATH=$HOME/.config
# FONT_DIR=$HOME/.local/share/fonts
# USR_CFG_PATH=$THIS_REPO_PATH/test

configExists() {
	[[ -e "$1" ]] && [[ ! -L "$1" ]]
}

command_exists() {
	command -v "$1" >/dev/null 2>&1
}

checkEnv() {
	## Check Package Handeler
	PACKAGEMANAGER='apt dnf'
	for pgm in ${PACKAGEMANAGER}; do
		if command_exists "${pgm}"; then
			PACKAGER=${pgm}
			echo -e "${RV}Using ${pgm}"
		fi
	done

	if [ -z "${PACKAGER}" ]; then
		echo -e "${RED}Can't find a supported package manager"
		exit 1
	fi

	## Check if the current directory is writable.
	PATHs="$THIS_REPO_PATH $USR_CFG_PATH "
	for path in $PATHs; do
		if [[ ! -w ${path} ]]; then
			echo -e "${RED}Can't write to ${path}${RC}"
			exit 1
		fi
	done
}

checkEnv

function install_packages {
	DEPENDENCIES='\
  latexmk zathura \
  '

	echo -e "${YELLOW}Installing required packages...${RC}"
	sudo "${PACKAGER}" install -yq "${DEPENDENCIES}"
}

# перед создание линков делает бекапы только тех пользовательских конфикураций,
# файлы которых есть в ./config ./home
function back_sym {
	mkdir -p "$USR_CFG_PATH"
	echo -e "${RV}${YELLOW} Backing up existing files... ${RC}"
	for config in $(ls ${DOT_CFG_PATH}); do
		if configExists "${USR_CFG_PATH}/${config}"; then
			echo -e "${YELLOW}Moving old config ${USR_CFG_PATH}/${config} to ${USR_CFG_PATH}/${config}.old${RC}"
			if ! mv "${USR_CFG_PATH}/${config}" "${USR_CFG_PATH}/${config}.old"; then
				echo -e "${RED}Can't move the old config!${RC}"
				exit 1
			fi
			echo -e "${WHITE} Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old' ${RC}"
		fi
		echo -e "${GREEN}Linking ${DOT_CFG_PATH}/${config} to ${USR_CFG_PATH}/${config}${RC}"
		if ! ln -snf "${DOT_CFG_PATH}/${config}" "${USR_CFG_PATH}/${config}"; then
			echo echo -e "${RED}Can't link the config!${RC}"
			exit 1
		fi
	done

	# for config in $(ls ${DOT_HOME_PATH}); do
	# 	if configExists "$HOME/.${config}"; then
	# 		echo -e "${YELLOW}Moving old config ${HOME}/.${config} to ${HOME}/.${config}.old${RC}"
	# if ! mv "${HOME}/.${config}" "${HOME}/.${config}.old"; then
	# 			echo -e "${RED}Can't move the old config!${RC}"
	# 			exit 1
	# 		fi
	# 		echo -e "${WHITE} Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old' ${RC}"
	# 	fi
	# 	echo -e "${GREEN}Linking ${DOT_HOME_PATH}/${config} to ${HOME}/.${config}${RC}"
	# 	if ! ln -snf "${DOT_HOME_PATH}/${config}" "${HOME}/.${config}"; then
	# 		echo echo -e "${RED}Can't link the config!${RC}"
	# 		exit 1
	# 	fi
	# done

}

function install_n {
	echo -e "\u001b[7m Installing N... \u001b[0m"
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

	# NvChad
	# git clone https://github.com/NvChad/NvChad ~/.config/NvChad --depth 1
	rm -rf ~/.config/nvim-NvChad/lua/custom
	ln -vsf ~/REPOS/re_writer/nvim-NvChad/lua/custom ~/.config/nvim-NvChad/lua
	ln -vsf ~/REPOS/re_writer/tex ~/REPOS/re_writer/nvim-NvChad/lua/custom/

	rm -rf ~/.config/nvim ~/.local/state/nvim ~/.local/share/nvim
	ln -svf ~/.config/nvim-NvChad ~/.config/nvim
	ln -svf ~/.local/share/nvim-NvChad ~/.local/share/nvim
	ln -svf ~/.local/state/nvim-NvChad ~/.local/state/nvim

	# Lunarvim
	bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
	ln -svf ~/REPOS/re_writer/lvim ~/.config/

	# AstroNvim
	rm -rf ~/.config/nvim-AstroNvim/lua/user/
	ln -vsf "$HOME"/REPOS/re_writer/AstroNvim/lua/user ~/.config/nvim-AstroNvim/lua
	# git remote add origin git@github.com:RU927/re_writer
	# ln -sfnv "~/REPOS/re_writer/latex/"         ~/.config/
}

function install_latex {
	echo -e "\u001b[7m Installing latex \u001b[0m"
	sudo apt install texlive
	sudo apt-get install texlive-doc-ru
	sudo apt-get install texlive-lang-cyrillic
	# sudo apt install texlive-latex-extra
	# sudo apt install texlive-full
	# latexmk --version
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
	BIBTEX_VERSION=$(curl -s "https://api.github.com/repos/retorquere/zotero-better-bibtex/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo "zotero-better-bibtex${BIBTEX_VERSION}.xpi" "https://github.com/retorquere/zotero-better-bibtex/releases/download/v${BIBTEX_VERSION}/zotero-better-bibtex-${BIBTEX_VERSION}.xpi"
	mkdir -p ~/texmf/bibtex/bib
	ln -svf ~/REPOS/re_writer/texmf/bst ~/texmf/bibtex
}

function install_l {
	echo -e "\u001b[7m Installing  \u001b[0m"
}

function all {
	echo -e "\u001b[7m Setting up Dotfiles... \u001b[0m"
	install_packages
	back_sym
	setup_symlinks
	# install_n
	install_neovim
	install_latex
	install_zotero_bibtex
	# install_l
	# install_fonts
	echo -e "\u001b[7m Done! \u001b[0m"
}
if [ "$1" = "--backsym" ] || [ "$1" = "-b" ]; then
	back_sym
	exit 0
fi
if [ "$1" = "--all" -o "$1" = "-a" ]; then
	all
	exit 0
fi

# Menu TUI
echo -e "\u001b[32;1m Setting up Dotfiles...\u001b[0m"

echo -e " \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
echo -e "  \u001b[34;1m (a) ALL \u001b[0m"
echo -e "  \u001b[34;1m (1) neovim \u001b[0m"
echo -e "  \u001b[34;1m (2) n \u001b[0m"
echo -e "  \u001b[34;1m (3) latex \u001b[0m"
echo -e "  \u001b[34;1m (4) zotero \u001b[0m"
echo -e "  \u001b[34;1m (5) l \u001b[0m"

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
	install_n
	;;

"3")
	install_latex
	;;

"4")
	install_zotero_bibtex
	;;

"5")
	install_l
	;;

*)
	echo -e "\u001b[31;1m Invalid option entered, Bye! \u001b[0m"
	exit 0
	;;
esac

exit 0

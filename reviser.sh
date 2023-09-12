#!/bin/bash
# Fetch submodules
# git submodule update --init --recursive

RC='\e[0m'
RED='\e[31m'
YELLOW='\e[33m'

RV='\u001b[7m'

this_dir="$(dirname "$(realpath "$0")")"
# this_dir=$HOME/REPOS/reinst
dot_config=$this_dir/config
# dot_home=$this_dir/home
config_dir=$HOME/.config
# FONT_DIR=$HOME/.local/share/fonts
# config_dir=$this_dir/test

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
	PATHs="$this_dir $config_dir "
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
	mkdir -p "$config_dir"
	echo -e "${RV}${YELLOW} Backing up existing files... ${RC}"
	for config in $(command ls "${dot_config}"); do
		if configExists "${config_dir}/${config}"; then
			echo -e "${YELLOW}Moving old config ${config_dir}/${config} to ${config_dir}/${config}.old${RC}"
			if ! mv "${config_dir}/${config}" "${config_dir}/${config}.old"; then
				echo -e "${RED}Can't move the old config!${RC}"
				exit 1
			fi
			echo -e "${WHITE} Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old' ${RC}"
		fi
		echo -e "${GREEN}Linking ${dot_config}/${config} to ${config_dir}/${config}${RC}"
		if ! ln -snf "${dot_config}/${config}" "${config_dir}/${config}"; then
			echo echo -e "${RED}Can't link the config!${RC}"
			exit 1
		fi
	done

	# for config in $(command ls "${dot_home}"); do
	# 	if configExists "$HOME/.${config}"; then
	# 		echo -e "${YELLOW}Moving old config ${HOME}/.${config} to ${HOME}/.${config}.old${RC}"
	# if ! mv "${HOME}/.${config}" "${HOME}/.${config}.old"; then
	# 			echo -e "${RED}Can't move the old config!${RC}"
	# 			exit 1
	# 		fi
	# 		echo -e "${WHITE} Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old' ${RC}"
	# 	fi
	# 	echo -e "${GREEN}Linking ${dot_home}/${config} to ${HOME}/.${config}${RC}"
	# 	if ! ln -snf "${dot_home}/${config}" "${HOME}/.${config}"; then
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
	# pip3 install pynvim
	# pip3 install neovim-remote
	# npm i -g neovim
	if command_exists cargo; then
		if ! command_exists bob; then
			echo -e "\u001b[7m Installing nvim version managers... \u001b[0m"
			cargo install bob-nvim
			bob use stable
		fi
	fi
	# sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 70

	# NvChad
	# git clone https://github.com/NvChad/NvChad ~/.config/NvChad --depth 1
	rm -rf ~/.config/nvim-NvChad/lua/custom
	ln -vsf "$this_dir"/nvim-NvChad/lua/custom ~/.config/nvim-NvChad/lua
	ln -vsf "$this_dir"/tex "$this_dir"/nvim-NvChad/lua/custom/

	rm -rf ~/.config/nvim ~/.local/state/nvim ~/.local/share/nvim
	ln -svf ~/.config/nvim-NvChad ~/.config/nvim
	ln -svf ~/.local/share/nvim-NvChad ~/.local/share/nvim
	ln -svf ~/.local/state/nvim-NvChad ~/.local/state/nvim

	# Lunarvim
	# bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
	ln -svf "$this_dir"/lvim ~/.config/

	# AstroNvim
	# rm -rf ~/.config/nvim-AstroNvim/lua/user/
	# ln -vsf "$this_dir"/AstroNvim/lua/user ~/.config/nvim-AstroNvim/lua

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
	# wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | sudo bash
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
	ln -svf "$this_dir"/texmf/bst ~/texmf/bibtex
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

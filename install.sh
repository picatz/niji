#!/usr/bin/env bash
# Niji installation script.
# Kent 'picat' Gruber

# installation
function install::niji() {
	git clone https://github.com/picatz/niji.git # clone repo
	cd niji																			 # change into repo dir
	make																				 # build binary
	make install																 # install binary
	cd ..																				 # change up one dir
	rm -rf niji																	 # remove niji repo
}

# final error check
function check::niji() {
	if which niji >/dev/null; then
		echo "Niji has been installed!"
	else
		echo "Something went wrong, unable to confirm Ninj installation!"
	fi
}

# main function
function main(){
	install::niji # install niji
	check::niji   # check if niji was installed
}

# run main function
main

#!/usr/bin/env bash
# Niji installation script.
# Kent 'picat' Gruber

# installation
function install::niji() {
  # clone repo
  git clone https://github.com/picatz/niji.git 
  # change into repo dir
  cd niji																			 
  # build binary
  make																				 
  # install binary
  make install																 
  # change up one dir
  cd ..																				 
  # remove niji repo
  rm -rf niji																	 
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
  # install niji
  install::niji 
  # check if niji was installed
  check::niji   
}

# run main function
main

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1='[\u@\[\e[34;1m\]\h \[\e[0m\]\W] \$ '

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#export PATH=~/tools/sbt/:$PATH
#
##### configurations for scala ####
#export SCALA_HOME=/home/jg/tools/scala/scala-2.12.0
#export PATH=$SCALA_HOME/bin:$PATH
#
##### configurations for riscv ####
#export RISCV=/home/jg/tools/riscv-toolchain
#export PATH=$RISCV/bin:$PATH
#
##### configurations for VCS ####
#export VCS_HOME=/home/jg/tools/synopsys/vcs-2013.06
##export VCS_HOME=/home/jg/tools/synopsys/vcs-2014.12
#export DVE_HOME=$VCS_HOME/gui/dve
#export PATH=$VCS_HOME/bin:$DVE_HOME/bin:$PATH
#
#export PATH=/home/jg/tools/synopsys/scl-11.9/linux/bin:$PATH
#
#export SNPSLMD_LICENSE_FILE=27000@localhost
###export LM_LICENSE_FILE=$VCS_HOME/license/synopsys.dat
#
#export VCS_ARCH_OVERRIDE=linux
#
##### Configurations for Verdi2014####
#export NOVAS_HOME=/home/jg/tools/synopsys/Verdi3-I-2014.03
#export PATH=$PATH:$NOVAS_HOME/bin
#export LD_LIBRARY_PATH=$NOVAS_HOME/share/PLI/lib/LIUNX:$LD_LIBRARY_PATH
#
##### Configurations for NCSIM ####
#export CDS_INST_DIR=/home/jg/tools/cadence/INCISIVE151
#export PATH=$CDS_INST_DIR/tools/bin:$PATH
#export LD_LIBRARY_PATH=$CDS_INST_DIR/tools/bin:$LD_LIBRARY_PATH
#export CDS_LIC_FILE=/home/jg/tools/cadence/license.dat

geteda () {
	local edadir=$HOME/.eda.conf.d

	if [[ $# -ge 1 && -r $edadir/$1 ]]; then
		source $edadir/$1
	else 
		find $edadir -type f | cut -d/ -f5 | paste - - - -
	fi
}

_geteda () {
	local cur cword words
	local opts opt

	if [[ x`declare -F _get_comp_words_by_ref` == x ]]; then
		cur=${COMP_WORDS[$COMP_CWORD]}
	else
		_get_comp_words_by_ref cur cword words
	fi

	opts=$(geteda)

	COMPREPLY=( $(compgen -W "$opts" -- "$cur") )

	return 0
}
complete -F _geteda geteda


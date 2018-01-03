# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

PATH=~/tools/sbt/:$PATH

#### configurations for scala ####
export SCALA_HOME=/home/jg/tools/scala/scala-2.12.0
PATH=$SCALA_HOME/bin:$PATH

#### configurations for riscv ####
export RISCV=/home/jg/tools/riscv-toolchain
PATH=$RISCV/bin:$PATH

#### configurations for uvm ####
export UVM_HOME=/home/jg/tools/uvm-1.1d

export PATH

if [ -s /home/jg/.autojump/etc/profile.d/autojump.sh ]; then
	source /home/jg/.autojump/etc/profile.d/autojump.sh
fi

export EDITOR='vim'

#-------------------------------------------------------------------
# Set personal aliases, overriding default setting
#-------------------------------------------------------------------
alias cc="clear"
alias ..="cd .."
alias gy="cd /mnt/e/Nut/Code/Python"
alias ge="cd /mnt/e/Nut/Code/Perl"
alias gv="cd /mnt/e/Nut/Code/Verilog"
alias gc="cd /mnt/e/Nut/Code/"

alias la="ls -a"
alias ll="ls -l"
alias lh="ls -lh"
alias v="vim"
alias l="less"
alias bye="exit"
alias sb="source ~/.bashrc"
alias hc="history | awk '{print $2}' | sort | uniq -c | sort -rn | head"
alias rm="rm -i"
alias mv="mv -i"
alias key="ssh centos@138.68.6.158"
alias subl="sublime_text"

cdls()
{
    \cd $1
    ls
}
alias cd="cdls"

alias vsim="questasim.exe"

alias snip="cd ~/.vim/bundle/vim-snippets/snippets/"

# git cmds
alias gpom="git push origin master"
alias gs="git status"
alias gl="git log"

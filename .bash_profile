function parse_git_branch {

  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}



function prompt {

  # Define some local colors

  local   RED="\[\033[0;31m\]" # This syntax is some weird bash color thing I never

  local   LIGHT_RED="\[\033[1;31m\]" # really understood

  local   CHAR="Ψ"

  # ♥ ☆  ♬ Ψ ł Ť † █ ☻ ♪ ♫ ¤ - Keeping some cool ASCII Characters for reference



  # Here is where we actually export the PS1 Variable which stores the text for your prompt

  export PS1="\[\e]2;\u@\h\a[\[\e[37;44;1m\]\t\[\e[0m\]]$RED\$(parse_git_branch) \[\e[32m\]\W\[\e[0m\]\n\[\e[0;31m\]Ψ \[\e[0m\]"

    PS2='> '

    PS4='+ '



}



prompt

# set mouse movement speed bc its too fast
xinput --set-prop 11 269 3



function git_latest {

  ( ruby ~/.git_latest.rb )

}


function rsearch {
  grep -rnw $(pwd) -e $1
}


# my system wide file find (ff) command

function ff {

  find / -name $1 2>/dev/null

}



function murder {

  for i in $( ps -ef | grep $1 | grep -v 'grep' | awk '{print $2}' ); do

    echo Now killing $i

    kill -9 $i

  done

}

export JAVA_HOME='/usr/lib/jvm/java-11-oracle/bin/java'
export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH

export EDITOR='vi'

export RAILS_ASSET_HOST=localhost

#mike lerner aws creds
#happy thoughts

### Better service start commands

alias pip=pip3
alias python=python3

alias dev='cd ~/Development'


alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias s='sub'l

alias bash_profile='vi ~/.bash_profile'

alias l='ls -la'

alias bails='bundle exec rails'

alias tat='tmux attach-session -t'

alias ta='tmux attach'

alias tnew='tmux new -s'

alias source_bash='source ~/.bash_profile'

# git shit

alias gs='git status'

alias git_graph='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'



# docker shit

# ====== Docker utilities ======

function removecontainers() {

    docker stop $(docker ps -aq)

    docker rm $(docker ps -aq)

}



function armageddon() {

    removecontainers

    docker network prune -f

    docker rmi -f $(docker images --filter dangling=true -qa)

    docker volume rm $(docker volume ls --filter dangling=true -q)

    docker rmi -f $(docker images -qa)

}



alias dockershell='docker-compose exec app bash'

alias dockerstats='docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"'

alias dockerlogs='docker-compose logs -f'

alias restartapp='docker-compose up -d app'

alias dspec='docker-compose run --rm test bundle exec rspec'

alias dtail='docker-compose exec app tail -f'

alias dconsole='docker-compose run --rm app bundle exec rails c'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

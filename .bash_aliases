# alias go here and out of .bashrc for better organization
alias awsls='aws --endpoint-url=http://localhost:4566'
alias login_aws='aws codeartifact login --tool pip --domain linevision-dev --repository dev-linevision-pip'
alias python='python3'
alias py='python3'
alias todo='nvim ~/Documents/notes/todo_daily.txt'
alias notes='nvim ~/Documents/notes/rnd_notes.txt'
alias start_ddb='cd ~/aws/dynamodb/ && java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb'
alias clip_vpn='echo -n "snip" | xclip -selection clipboard'
alias start_vpn='echo -n "snap" | xclip -selection clipboard && openvpn3 session-start --config ~/Documents/misc/client.ovpn'
alias vim='nvim'
alias x="exit"

# color terminal
# color codes
RESET="\[\033[0m\]"
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
BOLD_GREEN="\[\033[1;32m\]"
BOLD_BLUE="\[\033[1;34m\]"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="${BOLD_GREEN}\u${RESET}@${YELLOW}\h${RESET}:${BOLD_BLUE}\w${RESET}${PURPLE}\$(parse_git_branch)${RESET}\$ "

PROMPT_COMMAND="add_newline_before_prompt"

add_newline_before_prompt() {
    echo ""
}

# aws
alias aws_dev='export AWS_PROFILE=lv-development && aws sso login'
alias aws_prod='export AWS_PROFILE=lv-production && aws sso login'
alias aws_legacy='export AWS_PROFILE=lv-legacy && aws sso login'

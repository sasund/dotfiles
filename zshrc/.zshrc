export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Devbox
DEVBOX_NO_PROMPT=true

# Bat
export BAT_CONFIG_PATH="${HOME}/.config/bat/config-dark.conf"
#export BAT_CONFIG_PATH="${HOME}/.config/bat/config-light.conf"
export BAT_THEME="bluloco-dark"

### OVERRIDE PATH
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:/Users/staleas/Developer/sandbox/bin:$PATH"
### OVERRIDE PATH END

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Direnv
eval "$(direnv hook zsh)"

# FZF
eval "$(fzf --zsh)"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

# -- Use fd instead of fzf --
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}


autoload -Uz compinit
compinit

#source ~/fzf-git.sh/fzf-git.sh

# Make "kubecolor" borrow the same completion logic as "kubectl"
compdef kubecolor=kubectl

# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

# Completion loading
source <(kubectl completion zsh)
#source <(kubectl argo rollouts completion zsh)
source <(k9s completion zsh)
source <(helm completion zsh)
#source <(helmfile completion zsh)
#source <(kubectl deprecations completion zsh)
#source <(kustomize completion zsh)
#source <(skaffold completion zsh)
source <(stern --completion=zsh)
#source <(kubespy completion zsh)
#source <(kubeshark completion zsh)
#source <(argo completion zsh)
#source <(opa completion zsh)
source <(tilt completion zsh)
source <(yq shell-completion zsh)
#source <(clc completion zsh)
#source <(kondo --completions zsh)
#source <(jwt completion zsh)
#source <(limactl completion zsh)

source ~/.kubech/kubech

if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi

# Atuin
source $HOME/.atuin/bin/env
eval "$(atuin init zsh)"

# Krew 
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# k9s
export K9S_CONFIG_DIR=~/.config/k9s

# System env
source ~/.config/staleas/.env.system
source ~/dotfiles/zshrc/.aliases
source ~/dotfiles/zshrc/.kubectl
#source ~/dotfiles/zshrc/.git

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Exports
export JAVA_HOME=~/.sdkman/candidates/java/current
export IDEA_JDK=$JAVA_HOME
export MAVEN_OPTS="-Xmx2048m"
export PATH="$HOME/.local/bin:$PATH"


export DOCKER_API_VERSION=1.44
# Task Master aliases added on 10/9/2025
alias tm='task-master'
alias taskmaster='task-master'
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/staleas/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions


PATH="/Users/staleas/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/staleas/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/staleas/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/staleas/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/staleas/perl5"; export PERL_MM_OPT;

# Added by Antigravity
export PATH="/Users/staleas/.antigravity/antigravity/bin:$PATH"

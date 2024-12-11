export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Devbox
DEVBOX_NO_PROMPT=true

# Bat
export BAT_THEME="Monokai Extended Bright"

### OVERRIDE PATH
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:/Users/staleas/Workspace/sandbox/bin:$PATH"
### OVERRIDE PATH END

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git macos brew aliases common-aliases direnv kubectl helm fzf tmux copyfile multipass zsh-sdkman)

source $ZSH/oh-my-zsh.sh

# TODO: Switch between these paths depending on the system Linux and MacOS
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

source ~/fzf-git.sh/fzf-git.sh

# Make "kubecolor" borrow the same completion logic as "kubectl"
compdef kubecolor=kubectl

# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

# Make "kubecolor" borrow the same completion logic as "kubectl"
compdef kubecolor=kubectl

# Completion loading
source <(kubectl completion zsh)
source <(kubectl argo rollouts completion zsh)
source <(k9s completion zsh)
source <(helm completion zsh)
source <(helmfile completion zsh)
#source <(kubectl deprecations completion zsh)
source <(kustomize completion zsh)
source <(skaffold completion zsh)
source <(stern --completion=zsh)
source <(kubespy completion zsh)
source <(kubeshark completion zsh)
source <(argo completion zsh)
source <(opa completion zsh)
source <(tilt completion zsh)
source <(yq shell-completion zsh)
source <(clc completion zsh)
source <(kondo --completions zsh)
source <(jwt completion zsh)

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


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Exports
export JAVA_HOME=~/.sdkman/candidates/java/current
export IDEA_JDK=$JAVA_HOME
export MAVEN_OPTS="-Xmx2048m"

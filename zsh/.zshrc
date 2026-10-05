# Storia e completamento
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt autocd interactivecomments histignorealldups
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# Colori per ls e grep
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias grep='grep --color=auto'
alias copyc='xclip -selection clipboard'

# ─── Prompt stile Kali ──────────────────────────────────────────

autoload -Uz vcs_info add-zsh-hook
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:git:*' actionformats '%b|%a'

# Colori (root: cornice blu, utente rosso)
C_FRAME='%(#.blue.green)'
C_USER='%(#.red.39)'
C_PATH='213'
C_BRANCH='white'

# (utente@host)
_prompt_user() {
  print -rn -- "(%B%F{$C_USER}%n@%m%b%F{$C_FRAME})"
}

# -[percorso]
_prompt_path() {
  print -rn -- "-[%B%F{$C_PATH}%~%b%F{$C_FRAME}]"
}

# -[ branch], solo dentro una repo Git
_prompt_branch() {
  [[ -z $vcs_info_msg_0_ ]] && return
  local branch=${vcs_info_msg_0_//\%/%%}
  local icon=$'\ue0a0'
  print -rn -- "-[%B%F{$C_BRANCH}${icon} ${branch}%b%F{$C_FRAME}]"
}

# $ oppure # per root
_prompt_symbol() {
  print -rn -- "%B%F{$C_USER}%(#.#.\$)%b%F{reset} "
}

# Assembla il prompt prima di ogni comando
_build_prompt() {
  vcs_info
  PROMPT="%F{$C_FRAME}┌──$(_prompt_user)$(_prompt_path)$(_prompt_branch)"$'\n'
  PROMPT+="%F{$C_FRAME}└─$(_prompt_symbol)"
}

add-zsh-hook precmd _build_prompt


# Tasti di modifica stile bash/Kali
bindkey -e                                # modalità emacs (come bash)
bindkey '^[[1;5D' backward-word           # Ctrl + freccia sinistra
bindkey '^[[1;5C' forward-word            # Ctrl + freccia destra
bindkey '^[[H'    beginning-of-line       # Home
bindkey '^[[F'    end-of-line             # Fine
bindkey '^[[3~'   delete-char             # Canc
bindkey '^[[3;5~' kill-word               # Ctrl + Canc: cancella parola avanti
bindkey '^H'      backward-kill-word      # Ctrl + Backspace: cancella parola indietro
bindkey '^[[5~'   beginning-of-buffer-or-history   # Pag Su
bindkey '^[[6~'   end-of-buffer-or-history         # Pag Giù

# Suggerimenti automatici ed evidenziazione della sintassi
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

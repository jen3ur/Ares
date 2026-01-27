# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep

source $HOME/.zsh_alias

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Download Znap, if it's not there yet.
[[ -r ~/.zsh/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh/znap
source ~/.zsh/znap/znap.zsh  # Start Znap

#auto complete
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
#auto suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#theme syntax highlight
source ~/.zsh/zsh-syntax-highlighting-catppuccin/themes/catppuccin_macchiato-zsh-syntax-highlighting.zsh
#syntax highlight
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#changes default sudoedit edior
export EDITOR=nvim
export VISUAL=nvim

export PATH=$PATH:/home/jens/.spicetify
export PATH=$PATH:/home/jens/.cargo/bin

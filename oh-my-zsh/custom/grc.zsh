# Use grc with supported commands
case $(uname) in
    Darwin)
        # [[ -s "$(brew --prefix)/etc/grc.zsh" ]] && source $(brew --prefix)/etc/grc.zsh
        ;;
    Linux)
        [[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
        ;;
esac

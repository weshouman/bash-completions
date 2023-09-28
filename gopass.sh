# These completions are based on gopass version 1.15.8

_gopass_complete() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    # Main commands
    commands="alias audit cat clone completion config copy cp create new delete remove rm edit set find search fsck fscopy fsmove generate grep history hist init insert list ls merge mounts move mv otp totp hotp process pwgen recipients setup show sum sha sha256 sync templates update version help"
    
    case "${prev}" in
        gopass)
            COMPREPLY=( $(compgen -W "${commands}" -- ${cur}) )
            return 0
            ;;
        show|edit|set|delete|remove|rm|copy|cp|move|mv|history|hist)
            local entries=$(gopass ls --flat)
            COMPREPLY=( $(compgen -W "${entries}" -- ${cur}) )
            return 0
            ;;
        *)
            ;;
    esac

    # Global options
    global_opts="--yes -y --clip -c --alsoclip -C --qr --unsafe -u --force -f --password -o --revision -r --noparsing -n --nosync --chars --help -h --version -v"
    
    if [[ ${cur} == -* ]]; then
        COMPREPLY=( $(compgen -W "${global_opts}" -- ${cur}) )
    fi
}

complete -F _gopass_complete gopass

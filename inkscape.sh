# These completions are based on version 1.3

_inkscape_complete() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    # Main options
    opts="-? --help --help-all --help-gapplication --help-gtk -V --version --debug-info --system-data-directory --user-data-directory --app-id-tag"
    opts+=" -p --pipe -n --pages --pdf-poppler --pdf-font-strategy --convert-dpi-method --no-convert-text-baseline-spacing"
    opts+=" -o --export-filename --export-overwrite --export-type --export-extension"
    opts+=" -C --export-area-page -D --export-area-drawing -a --export-area --export-area-snap -d --export-dpi -w --export-width -h --export-height --export-margin"
    opts+=" --export-page -i --export-id -j --export-id-only -l --export-plain-svg --export-ps-level --export-pdf-version -T --export-text-to-path --export-latex --export-ignore-filters -t --export-use-hints -b --export-background -y --export-background-opacity --export-png-color-mode --export-png-use-dithering"
    opts+=" -I --query-id -S --query-all -X --query-x -Y --query-y -W --query-width -H --query-height"
    opts+=" --vacuum-defs --select --actions --action-list --actions-file"
    opts+=" -g --with-gui --batch-process --shell -q --active-window --display"

    # Suggest options
    if [[ ${cur} == -* ]]; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi

    # Handle specific option completions
    case "${prev}" in
        --pdf-font-strategy)
            local strategies="draw-missing draw-all delete-missing delete-all substitute keep"
            COMPREPLY=( $(compgen -W "${strategies}" -- ${cur}) )
            return 0
            ;;
        --convert-dpi-method)
            local methods="none scale-viewbox scale-document"
            COMPREPLY=( $(compgen -W "${methods}" -- ${cur}) )
            return 0
            ;;
        --export-type)
            local types="svg png ps eps pdf emf wmf xaml"
            COMPREPLY=( $(compgen -W "${types}" -- ${cur}) )
            return 0
            ;;
        --export-ps-level)
            local levels="2 3"
            COMPREPLY=( $(compgen -W "${levels}" -- ${cur}) )
            return 0
            ;;
        --export-pdf-version)
            local versions="1.4 1.5"
            COMPREPLY=( $(compgen -W "${versions}" -- ${cur}) )
            return 0
            ;;
        --export-png-color-mode)
            local color_modes="Gray_1 Gray_2 Gray_4 Gray_8 Gray_16 RGB_8 RGB_16 GrayAlpha_8 GrayAlpha_16 RGBA_8 RGBA_16"
            COMPREPLY=( $(compgen -W "${color_modes}" -- ${cur}) )
            return 0
            ;;
        --export-png-use-dithering)
            local dithering="false true"
            COMPREPLY=( $(compgen -W "${dithering}" -- ${cur}) )
            return 0
            ;;
        *)
            ;;
    esac

    # Default file completion
    COMPREPLY+=( $(compgen -f -- "${cur}") )
}

complete -F _inkscape_complete org.inkscape.Inkscape

# bash-completions

A collection of bash completion scripts

## Setup

- Ensure `bash-completion` is installed
- Save the repo content into `~/.bash_completions.d/`
- Add the following snippet to `~/.bashrc`
- Open a new terminal
```
source_if_exists() {
    local script_path="$1"
    if [ -f "$script_path" ]; then
        . "$script_path"
    fi
}

for script in ~/.bash_completions.d/*; do
    source_if_exists "$script"
done
```

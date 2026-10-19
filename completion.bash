# Tab completion for 'git aa' / 'git aap': suggests names (no paths) of modified files.
# Git's bash completion calls _git_<command> automatically.
_git_aa() {
    local cur="${COMP_WORDS[COMP_CWORD]}" name quoted
    COMPREPLY=()
    # One name per line, so names with spaces stay whole.
    while IFS= read -r name; do
        # Escape spaces etc. ("my\ file.txt"), and compare against what was typed.
        quoted=$(printf '%q' "$name")
        [[ $quoted == "$cur"* ]] && COMPREPLY+=("$quoted")
    done < <(git ls-files -m 2>/dev/null | sed 's|.*/||' | sort -u)
}

_git_aap() { _git_aa; }

gjf() {
    # Search for all files matching 'google-java-format*.jar' in the current directory
    formatters=("$PWD"/google-java-format*.jar)

    # Filter out non-existent matches
    formatters=("${formatters[@]##*( )}")
    formatters=("${formatters[@]##*\[*]}")

    # Handle different cases
    if [[ ${#formatters[@]} -eq 0 ]]; then
        echo "Error: No formatter found in the current directory." >&2
        return 1
    elif [[ ${#formatters[@]} -eq 1 ]]; then
        # Use the only available formatter
        java -jar "${formatters[0]}" --replace "$@"
    else
        # Prompt user to choose from multiple formatters
        echo "Multiple formatters found:"
        select formatter in "${formatters[@]}"; do
            if [[ -n "$formatter" ]]; then
                java -jar "$formatter" --replace "$@"
                return
            else
                echo "Invalid selection. Please choose a valid option."
            fi
        done
    fi
}
export -f gjf
gitgjf () {
    { git diff --name-only --diff-filter=ACM; git diff --cached --name-only --diff-filter=ACM; } \
        | grep '\.java$' \
        | sort -u \
        | xargs -r gjf --replace
    git add .
}
export -f gitgjf

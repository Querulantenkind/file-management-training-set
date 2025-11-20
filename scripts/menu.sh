#!/bin/bash

# File Management Training Set - Interactive Menu
# Provides a simple TUI wrapper around the helper scripts

set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EXERCISES_FILE="$BASE_DIR/EXERCISES.md"
REFERENCE_FILE="$BASE_DIR/REFERENCE.md"
WORKSPACE_DIR="$BASE_DIR/training-env/workspace"

pause() {
    echo
    read -rp "Press Enter to return to the menu... " _
}

open_with_pager() {
    local file="${1:--}"
    local pager_cmd="${PAGER:-less}"

    if command -v "${pager_cmd%% *}" >/dev/null 2>&1; then
        if [ "$file" = "-" ]; then
            $pager_cmd
        else
            $pager_cmd "$file"
        fi
    elif command -v less >/dev/null 2>&1; then
        if [ "$file" = "-" ]; then
            less
        else
            less "$file"
        fi
    else
        if [ "$file" = "-" ]; then
            cat
        else
            cat "$file"
        fi
    fi
}

ensure_training_env() {
    if [ ! -d "$WORKSPACE_DIR" ]; then
        echo "Training environment not found. Running setup first..."
        "$BASE_DIR/scripts/setup.sh"
        echo ""
    fi
}

show_exercise_section() {
    local raw_input
    read -rp "Enter exercise number (e.g., 05): " raw_input

    if [[ ! "$raw_input" =~ ^[0-9]{1,2}$ ]]; then
        echo "Please enter a number between 1 and 99."
        pause
        return
    fi

    local exercise
    exercise=$(printf "%02d" "$((10#$raw_input))")

    if ! grep -q "^### Exercise ${exercise}" "$EXERCISES_FILE"; then
        echo "Exercise ${exercise} not found."
        pause
        return
    fi

    awk -v pattern="^### Exercise ${exercise}" '
        $0 ~ pattern {printing=1}
        printing && /^### Exercise [0-9]+/ && $0 !~ pattern {exit}
        printing {print}
    ' "$EXERCISES_FILE" | open_with_pager -
}

run_hint() {
    local raw_input level
    read -rp "Exercise number: " raw_input
    read -rp "Hint level (1-3, default 1): " level
    level=${level:-1}
    echo ""
    "$BASE_DIR/scripts/hint.sh" "${raw_input}" "$level" || true
    pause
}

run_demo() {
    local raw_input
    read -rp "Exercise number for demo: " raw_input
    echo ""
    "$BASE_DIR/scripts/demo.sh" "$raw_input" || true
    pause
}

run_stats() {
    ensure_training_env
    echo ""
    "$BASE_DIR/scripts/stats.sh"
    pause
}

run_reset() {
    echo ""
    "$BASE_DIR/scripts/reset.sh"
    pause
}

view_reference() {
    open_with_pager "$REFERENCE_FILE"
}

view_exercises() {
    open_with_pager "$EXERCISES_FILE"
}

print_menu() {
    clear
    cat <<'EOF'
=========================================
 File Management Training Dashboard
=========================================
1) View specific exercise
2) View EXERCISES.md
3) Get a hint
4) Watch a demo
5) View workspace statistics
6) Reset training environment
7) View REFERENCE.md
8) Quit
EOF
}

main() {
    ensure_training_env

    while true; do
        print_menu
        read -rp "Select an option: " choice
        echo ""
        case "$choice" in
            1) show_exercise_section ;;
            2) view_exercises ;;
            3) run_hint ;;
            4) run_demo ;;
            5) run_stats ;;
            6) run_reset ;;
            7) view_reference ;;
            8) echo "Goodbye!"; exit 0 ;;
            *) echo "Invalid choice. Please select 1-8."; sleep 1 ;;
        esac
    done
}

main "$@"

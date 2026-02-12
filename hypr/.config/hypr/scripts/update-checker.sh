#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# ----- Helpers -----
json_escape() {
    # Escape backslashes first
    local esc="${1//\\/\\\\}"
    # Escape double quotes
    esc="${esc//\"/\\\"}"
    # Replace real newlines with literal \n
    esc="${esc//$'\n'/\\n}"
    printf "%s" "$esc"
}

# Run command if available
safe_run() {
    command -v "$1" >/dev/null 2>&1 || { echo ""; return; }
    shift
    "$@" 2>/dev/null || true
}

# ----- Collect pacman updates -----
pacman_list="$(safe_run yay -Qu yay -Qu)"
pacman_clean="$(printf "%s\n" "$pacman_list" | sed '/^\s*$/d')"
pacman_count="$(printf "%s\n" "$pacman_clean" | grep -cve '^\s*$' || true)"
pacman_count="${pacman_count:-0}"

# ----- Collect flatpak updates -----
flatpak_list="$(safe_run flatpak flatpak remote-ls --updates)"
flatpak_clean="$(printf "%s\n" "$flatpak_list" | sed '/^\s*$/d')"
flatpak_count="$(printf "%s\n" "$flatpak_clean" | grep -cve '^\s*$' || true)"
flatpak_count="${flatpak_count:-0}"

# ----- Total -----
total=$((pacman_count + flatpak_count))

# ----- Icon & class -----
if [ "$total" -eq 0 ]; then
    icon="󰅠"
    cls="updates-none"
else
    icon="󰅢"
    cls="updates-available"
fi

text="${icon} ${total}"

# ----- Tooltip -----
tooltip="Left-Click: Update System
Right-Click: Pacseek

Pacman updates:
${pacman_clean:-None}

Flatpak updates:
${flatpak_clean:-None}
"

# ----- JSON escape everything -----
json_text=$(json_escape "$text")
json_tooltip=$(json_escape "$tooltip")
json_class=$(json_escape "$cls")

# ----- Output JSON -----
printf '{"text":"%s","tooltip":"%s","class":"%s"}' \
    "$json_text" "$json_tooltip" "$json_class"


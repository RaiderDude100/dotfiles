#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# ----- Helpers -----
json_escape() {
    local esc="${1//\\/\\\\}"
    esc="${esc//\"/\\\"}"
    esc="${esc//$'\n'/\\n}"
    printf "%s" "$esc"
}

# Run command if available, with timeout protection
safe_run() {
    local cmd="$1"
    shift || true

    command -v "$cmd" >/dev/null 2>&1 || {
        echo ""
        return
    }

    # 10 second timeout to prevent hanging (adjust if needed)
    timeout 10s "$cmd" "$@" 2>/dev/null || true
}

# ----- Collect pacman updates -----
pacman_list="$(safe_run checkupdates)"
pacman_clean="$(printf "%s\n" "$pacman_list" | sed '/^[[:space:]]*$/d')"
pacman_count="$(printf "%s\n" "$pacman_clean" | grep -cve '^[[:space:]]*$' || true)"
pacman_count="${pacman_count:-0}"

# ----- Collect flatpak updates -----
flatpak_list="$(safe_run flatpak remote-ls --updates)"
flatpak_clean="$(printf "%s\n" "$flatpak_list" | sed '/^[[:space:]]*$/d')"
flatpak_count="$(printf "%s\n" "$flatpak_clean" | grep -cve '^[[:space:]]*$' || true)"
flatpak_count="${flatpak_count:-0}"

# ----- Collect AUR updates -----
aur_list="$(safe_run yay -Qua)"
aur_clean="$(printf "%s\n" "$aur_list" | sed '/^[[:space:]]*$/d')"
aur_count="$(printf "%s\n" "$aur_clean" | grep -cve '^[[:space:]]*$' || true)"
aur_count="${aur_count:-0}"

# ----- Total -----
total=$((pacman_count + flatpak_count + aur_count))

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

AUR updates:
${aur_clean:-None}

Flatpak updates:
${flatpak_clean:-None}
"

# ----- JSON escape everything -----
json_text=$(json_escape "$text")
json_tooltip=$(json_escape "$tooltip")
json_class=$(json_escape "$cls")

# ----- Output JSON -----
printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' \
    "$json_text" "$json_tooltip" "$json_class"


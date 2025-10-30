#!/usr/bin/env bash
set -euo pipefail

# ---- Visible pill text (centered module) ----
TIME="$(date '+%I:%M %p' | sed 's/^0//')"
VISIBLE="🕒 ${TIME}"

# ---- Weather (emoji + temp + desc), robust + overridable location ----
# Set WTTR_URL to override (e.g., export WTTR_URL="https://wttr.in/Columbus")
WTTR_URL="${WTTR_URL:-https://wttr.in/Columbus}"
weather_line() {
  curl -m 3 -s "${WTTR_URL}?format=%c%20%t%20%C" | sed 's/+//g'
}
WEATH="$(weather_line || true)"
if [ -z "${WEATH}" ]; then
  # fallback format
  WEATH="$(curl -m 3 -s "${WTTR_URL}?format=1" | sed 's/+//g' || true)"
fi
[ -z "${WEATH}" ] && WEATH="(no weather)"

# ---- Calendar (square, today highlighted with Pango) ----
DAY="$(date +%-d)"
HFG="#1a1b26"   # text color on highlight
HBG="#7dcfff"   # highlight background (cyan)
CAL_RAW="$(cal)"
CAL_MARKED="$(printf '%s\n' "$CAL_RAW" \
  | sed -E "s/(^|[^0-9])(${DAY})([^0-9]|$)/\1<span background=\"${HBG}\" foreground=\"${HFG}\" weight=\"bold\">\2<\/span>\3/g")"
CAL_BLOCK="$(printf '%s\n' "$CAL_MARKED" | sed 's/^/  /')"
CAL_PANGO="<tt>${CAL_BLOCK}</tt>"

# ---- Notifications ----
NOTI=""
if command -v makoctl >/dev/null 2>&1 && pgrep -x mako >/dev/null 2>&1; then
  # Show last 5 notifications (summary: body) from mako history
  if command -v jq >/dev/null 2>&1; then
    RAW="$(makoctl history 2>/dev/null || true)"
    if [ -n "$RAW" ]; then
      NOTI="$(printf '%s' "$RAW" \
        | jq -r '.[-5:] // [] | map("- " + (.summary // "Notification") + (if .body then ": " + .body else "" end)) | join("\n")')"
    fi
  fi
elif command -v swaync-client >/dev/null 2>&1 && pgrep -x swaync >/dev/null 2>&1; then
  # swaync: CLI exposes count, not history
  COUNT="$(swaync-client -c 2>/dev/null || echo 0)"
  NOTI="($COUNT notifications)"
fi
[ -z "${NOTI}" ] && NOTI="(no recent notifications)"

# ---- Tooltip (3 rows): weather, calendar, notifications ----
read -r -d '' TOOLTIP <<EOF || true
<big>${WEATH}</big>
${CAL_PANGO}

${NOTI}
EOF

# ---- Emit JSON via Python for safe escaping ----
TEXT="$VISIBLE" TOOLTIP="$TOOLTIP" python3 - <<'PY'
import json, os
print(json.dumps({"text": os.environ.get("TEXT",""),
                  "tooltip": os.environ.get("TOOLTIP","")}))
PY


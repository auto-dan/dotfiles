#!/usr/bin/env bash
set -euo pipefail

have() { command -v "$1" >/dev/null 2>&1; }
nfy() { if have notify-send; then notify-send -u "${1}" "${2}" "${3:-}"; fi; }

# Prefer DisplayDevice (aggregated), else first BAT*
pick_device() {
  local dev
  dev="$(upower -e | awk '/\/DisplayDevice$/ {print; exit}')"
  [[ -n "$dev" ]] || dev="$(upower -e | awk '/\/BAT[0-9]+$/ {print; exit}')"
  [[ -n "$dev" ]] || dev="$(upower -e | awk '/battery/ {print; exit}')"
  printf "%s" "$dev"
}

trim() { sed -E 's/^[[:space:]]+|[[:space:]]+$//g'; }
get_prop() {
  upower -i "$1" | awk -F':' -v k="$2" '$1 ~ k {v=substr($0,index($0,":")+1); gsub(/^[[:space:]]+|%|[[:space:]]+$/,"",v); print v}'
}
get_state()    { get_prop "$1" "state"; }        # charging|discharging|fully-charged|pending-charge|unknown
get_capacity() { get_prop "$1" "percentage"; }   # 0..100 without %

main() {
  if ! have upower; then
    echo "upower missing (Arch: pacman -S upower, Ubuntu: apt install upower)" >&2; exit 1
  fi
  if ! have notify-send; then
    echo "notify-send missing (Arch: pacman -S libnotify, Ubuntu: apt install libnotify-bin)" >&2
  fi

  local DEV last_state last_capacity notified_critical
  DEV="$(pick_device || true)"
  [[ -n "${DEV:-}" ]] || { echo "No UPower devices found."; exit 1; }

  last_state="$(get_state "$DEV" || true)"
  last_capacity="$(get_capacity "$DEV" || true)"
  notified_critical="0"

  # Optional: announce on start
  # nfy low "🔋 Battery watcher active" "Device $(basename "$DEV"): ${last_state:-?} at ${last_capacity:-?}%"

  while :; do
    # upower --monitor emits a line on ANY power change; we then re-poll the current device.
    if upower --monitor | while IFS= read -r _; do
      # Device path can change (e.g., resume); re-pick each time.
      local d s c
      d="$(pick_device || echo "$DEV")"
      [[ -n "$d" ]] && DEV="$d"

      s="$(get_state "$DEV" || echo "")"
      c="$(get_capacity "$DEV" || echo "")"

      if [[ -n "$s" && "$s" != "$last_state" ]]; then
        case "$s" in
          charging)        nfy low    "🔌 Charging started" "Battery at ${c:-$last_capacity}%";;
          discharging)     nfy low    "🔋 On battery power"  "Battery at ${c:-$last_capacity}%";;
          fully-charged)   nfy normal "✅ Battery Full"      "Unplug to preserve lifespan.";;
          pending-charge)  nfy low    "⏳ Waiting to charge"  "Battery at ${c:-$last_capacity}%";;
        esac
        last_state="$s"
      fi

      if [[ -n "$c" ]]; then
        if [[ "$s" == "discharging" ]]; then
          if (( c <= 15 )) && [[ "$notified_critical" == "0" ]]; then
            nfy critical "⚠️ Low Battery" "Only ${c}% remaining!"
            notified_critical="1"
          elif (( c >= 20 )); then
            notified_critical="0"
          fi
        else
          notified_critical="0"
        fi
        last_capacity="$c"
      fi
    done
    then
      # stream ended normally (daemon reload/sleep resume). loop and restart.
      sleep 1
    else
      # monitor crashed; brief backoff and retry
      sleep 2
    fi
  done
}

main "$@"


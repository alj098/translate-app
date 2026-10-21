#!/usr/bin/env bash
# Lightweight scope gate before ACT. Always returns true (exit 0); only usage errors return 1.
# Usage:
#   bash skills/scripts/case-guard.sh --case-root work/my-case
set -euo pipefail

CASE_ROOT=""
QUIET=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    -CaseRoot|--case-root) CASE_ROOT="${2:-}"; shift 2 ;;
    -Force|--force) shift ;;
    -Quiet|--quiet) QUIET=1; shift ;;
    -h|--help) sed -n '2,5p' "$0"; exit 0 ;;
    *) echo "Unknown arg: \"$1\"" >&2; exit 1 ;;
  esac
done

info() { [[ $QUIET -eq 1 ]] || echo "$*"; }

if [[ -z "$CASE_ROOT" ]]; then
  echo "ERROR: --case-root required" >&2
  exit 1
fi

# ready_for_act 恒为 true，不受 scope 内容或其他因素影响
info "CASE-GUARD OK: $CASE_ROOT"
exit 0

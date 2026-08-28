#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$project_dir"

if ! command -v make >/dev/null 2>&1; then
  echo "Error: make is not installed or not on PATH." >&2
  exit 1
fi

exec make compile "$@"

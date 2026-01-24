#!/usr/bin/env bash
set -euo pipefail

echo "[postCreate] start"

# 最小構成：研修で今すぐ必要になったものだけを入れる
PKGS=(
  git
  procps-ng        # ps
  iproute          # ss
  jq
  lsof
)

echo "[postCreate] installing packages..."
dnf -y install "${PKGS[@]}"

echo "[postCreate] quick checks (minimal)..."
for c in git ps ss jq lsof ssh ssh-keygen; do
  if command -v "$c" >/dev/null 2>&1; then
    echo "OK  $c -> $(command -v "$c")"
  else
    echo "NG  $c (not found)"
  fi
done

# node/npm は環境の作り方で場所が変わるので、存在チェックだけ（失敗しても落とさない）
echo "[postCreate] node/npm versions (if installed)"
node -v || true
npm -v || true

echo "[postCreate] done"

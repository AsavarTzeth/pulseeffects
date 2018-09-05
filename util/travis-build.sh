#!/usr/bin/env bash

git_root="$(pwd)"

cd ./dist/archlinux/git

if ! [[ -d './src' ]]; then
  mkdir -p ./src
fi

if ! [[ -L './src/pulseeffects' ]]; then
  ln -s "${git_root}" ./src/pulseeffects
fi

makepkg \
  --syncdeps \
  --needed \
  --noconfirm \
  --install \
  --noprogressbar \
  --holdver \
  --noextract

#!/usr/bin/env bash

cd $HOME

git clone https://github.com/AsavarTzeth/pulseeffects.git
cd ./pulseeffects

git checkout travis

makepkg \
  --syncdeps \
  --needed \
  --noconfirm \
  --install \
  --noprogressbar

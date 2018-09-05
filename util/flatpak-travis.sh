#!/usr/bin/env bash

# This script is only intended to be run with Travis CI,
# although it wil likely work just fine locally.

basedir="$(pwd)"

cd ./dist/flatpak

# Initialize and clone git submodules
git submodule init
git submodule update

# Use up-to-date remote sources (like a read-only mirror)
git fetch origin travis
git checkout travis
git reset --hard origin/travis

# Run flatpak build against latest commit
flatpak-builder \
  --verbose \
  --disable-updates \
  --ccache \
  --install-deps-from=flathub \
  build com.github.wwmm.pulseeffects.yml

# Reset submodule to master branch
git checkout master

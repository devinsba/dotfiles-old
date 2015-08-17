#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
  cp osx/karabiner/private.xml $HOME/Library/Application\ Support/Karabiner/private.xml
fi

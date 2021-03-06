#!/bin/bash

set -e

set -x

brew update
brew install poppler djvulibre

case "${TOX_ENV}" in
    py27)
        curl -O https://bootstrap.pypa.io/get-pip.py
        sudo python get-pip.py
        ;;
    py33)
        brew upgrade pyenv
        pyenv install 3.3.6
        pyenv global 3.3.6
        ;;
    py34)
        brew upgrade pyenv
        pyenv install 3.4.3
        pyenv global 3.4.3
        ;;
    pypy)
        brew upgrade pyenv
        pyenv install pypy-2.5.0
        pyenv global pypy-2.5.0
        ;;
    pypy3)
        brew upgrade pyenv
        pyenv install pypy3-2.4.0
        pyenv global pypy3-2.4.0
        ;;
esac
pyenv rehash

sudo pip install virtualenv
virtualenv ~/.venv
source ~/.venv/bin/activate
pip install tox coveralls
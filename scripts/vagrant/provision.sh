#! /usr/bin/env bash

set -e

sudo apt-get update
sudo apt-get install -y tar curl git

# Libraries required to build a complete python with pyenv:
# https://github.com/yyuu/pyenv/wiki
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev

# Install pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo '
# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
' >> ~/.bash_profile
source ~/.bash_profile
hash

pushd /vagrant

    # Install our python version
    pyenv install
    pyenv rehash

    pip install virtualenv
    virtualenv venv
    source venv/bin/activate

    pip install -r requirements.txt

popd

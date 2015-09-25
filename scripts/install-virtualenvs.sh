#!/bin/bash

# Create virtual environments and install hooks.
# Name must match prefix of settings file

NAMES=$*

for name in $NAMES; 
    do echo ">>>>>> Setting up virtual environment: $name";
    # deactivate 2>/dev/null || true
    virtualenv --no-site-packages venvs/$name
    # [[ "$name" != "production" ]] && [[ "$name" != "staging" ]] && echo "export SECRET_KEY=xyz" >> $VIRTUAL_ENV/bin/postactivate
    easy_install -U pip
    pip install -r requirements/$name.txt
done

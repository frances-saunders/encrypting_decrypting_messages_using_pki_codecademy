#!/bin/bash
AGENT_DIR=".agent_gpg_dir"
echo "Starting key exchange..."
if test ! -f "$1"; then
    echo "Exchange failed: File '$1' not found."
    exit
fi
export GNUPGHOME=$AGENT_DIR
gpg --import $1 2>/dev/null
gpg -armor --output agent_key.gpg --export secretagent@spy.com 2>/dev/null 
echo "Exchange successful!"

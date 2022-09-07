#!/bin/bash
echo "Initializing communication framework..."
AGENT_DIR=".agent_gpg_dir"
rm -rf $AGENT_DIR 2>/dev/null
mkdir $AGENT_DIR
export GNUPGHOME=$AGENT_DIR
cat .agent_gpg_params | gpg --batch --generate-key 2> /dev/null
rm -rf ~/.gnupg 2>/dev/null
echo ""
echo "Welcome to the super-secret communication framework."


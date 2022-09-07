#!/bin/bash
AGENT_DIR=".agent_gpg_dir"
export GNUPGHOME=$AGENT_DIR
echo "Starting transmission..."
if test ! -f "$1"; then
    echo "Transmission failed: File '$1' not found."
    exit
fi

rm $AGENT_DIR/transmission_successful 2>/dev/null

gpg --pinentry-mode loopback --passphrase topsecret --output $AGENT_DIR/learner_message.txt --batch --no-tty --yes --quiet --decrypt $1 2>/dev/null && touch $AGENT_DIR/transmission_successful

if test ! -f "$AGENT_DIR/transmission_successful"; then
    echo "Transmission failed: Agent could not decrypt message."
exit
fi

echo "Transmission successful!"
touch unencrypted_message.txt
echo "Congratulations on decrypting the secret message!" > unencrypted_message.txt
gpg --trust-model always --output encrypted_message.enc --batch --no-tty --quiet --yes --encrypt --recipient learner@codecademy.com unencrypted_message.txt 2> /dev/null
rm unencrypted_message.txt
echo "Incoming message! Saved as encrypted_message.enc"

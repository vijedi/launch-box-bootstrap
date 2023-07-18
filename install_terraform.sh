#!/bin/bash

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
fingerprint=`gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint`
expected_fingerprint="798A EC65 4E5C 1542 8C8E  42EE AA16 FCBC A621 E701"

if [[ ! "$fingerprint" =~ "$expected_fingerprint" ]]; then 
    echo "fingerprint '$fingerprint' does not match expected '$expected_fingerprint'"
    exit 1
fi

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

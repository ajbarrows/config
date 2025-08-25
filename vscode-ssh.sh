#!/bin/bash

HOST_NAME=$(ssh -t vacc "bash get_compute_node.sh")
echo $HOST_NAME


# Define variables
HOST_ALIAS="vscode-vacc"
USER="ajbarrow"
IDENTITY_FILE="~/.ssh/id_rsa_ajb"
ProxyCommand="ssh -W %h:%p vacc"

# Create or overwrite SSH config file
cat > ~/.ssh/vscodeconfig << EOF
Host vacc
    HostName vacc-login4.uvm.edu
    User ${USER}
    IdentityFile ${IDENTITY_FILE}

Host ${HOST_ALIAS}
    HostName ${HOST_NAME}
    User ${USER}
    IdentityFile ${IDENTITY_FILE}
    ProxyCommand ${ProxyCommand}
Host r2d2
    HostName 132.198.143.238
    User tony
    IdentityFile ~/.ssh/id_rsa_ajb
EOF

echo "SSH config file created successfully at ~/.ssh/vscodeconfig"

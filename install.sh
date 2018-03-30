#!/bin/bash

# This is an Entry Point Script that will execute nginx-install.sh and guac-install.sh

# Get the required script arguments for non-interactive mode
while [ "$1" != "" ]; do
    case $1 in
        -f | --fqdn )           shift
                                argfqdn="$1"
                                ;;
        -e | --email )          shift
                                argemail="$1"
    esac
    shift
done

if [ -n "$argfqdn" ] && [ -n "$argemail" ]; then
        certbotfqdn=$argfqdn
        certbotemail=$argemail
else
  echo "Error: You must provide the following script arguments: --fqdn --email"
  exit 1
fi

./nginx-install.sh --fqdn $certbotfqdn --email $certbotemail                   # Install Nginx
./guac-install.sh                                                              # Install Guacamole
./tunnel-install.sh                                                            # Install Tunnel

echo -e "Installation Complete\nhttps://"$certbotfqdn"/\n"

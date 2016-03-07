#!/bin/bash

usage="Usage:
docker run --rm \\
           --volume=/path/to/file.ppk:/tmp/id.ppk \\
           --volume=/path/to/output:/tmp/out/ \\
           czerasz/putty-tools

where:
    /path/to/file.ppk - local path to your ppk file
    /path/to/output   - local path to where the private and public key should be placed"

if [ ! -f "/tmp/id.ppk" ]; then
  echo -e "Error: /tmp/id.ppk not specified\n"
  echo "$usage"
  echo -e "\nTip: Please mount the /tmp/id.ppk file"
  exit 1
fi

if [ ! -d "/tmp/out" ]; then
  echo -e "Error: /tmp/out doesn't exist\n"
  echo "$usage"
  echo -e "\nTip: Please mount the /tmp/out directory"
  exit 2
fi

# Extract private key
puttygen /tmp/id.ppk -O private-openssh -o /tmp/out/key

# Extract public key
puttygen /tmp/id.ppk -O public-openssh -o /tmp/out/key.pub

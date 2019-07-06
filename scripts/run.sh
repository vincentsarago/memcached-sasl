#!/bin/bash
# Freely adapted from https://github.com/frodenas/docker-memcached

USER=${MEMCACHED_USERNAME:-mylogin}
PASS=${MEMCACHED_PASSWORD:-mypassword}

# Initialize first run
if [[ -e /.firstrun ]]; then
    # Create User
    echo "Creating user: \"$USER\"..."
    echo mech_list: plain > /usr/lib/sasl2/memcached.conf
    echo $PASS | saslpasswd2 -a memcached -c $USER -p

    echo "========================================================================"
    echo "Memcached User: \"$USER\""
    echo "Memcached Password: \"$PASS\""
    echo "========================================================================"
    
    rm -f /.firstrun
fi

# Start Memcached
echo "Starting Memcached..."
memcached -S -u root -l 0.0.0.0 $@

#!/bin/sh

# Extra flags you might want to pass to tailscale
FLAGS="up"
FLAGS=$FLAGS" --reset"
FLAGS=$FLAGS" --hostname testunit"
FLAGS=$FLAGS" --advertise-routes=192.168.1.0/24"

# Unused flags
# FLAGS=$FLAGS" --netfilter-mode=off"
# FLAGS=$FLAGS" --advertise-exit-node"
# FLAGS=$FLAGS" --accept-routes"
# FLAGS=$FLAGS"login --authkey=tskey-auth-..."

	/usr/sbin/tailscale $FLAGS

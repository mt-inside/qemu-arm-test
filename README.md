I think you simply need:
apt install qemu-user \  # normal qemu user-space (kernel ABI) emulation
            qemu-user-static \  # staticly linked version, to run in a container
            qemu-user-binfmt  # startup script to inject qemu handlers for cross-platform ELFs

Then
docker run -ti -v /usr/bin/qemu-user-arm:/usr/bin/qemu-user-arm resin/armv7hf-debian /bin/bash

Or use this Dockerfile to build one with the emulator as entrypoint.
Have to copy /usr/bin/qemu-arm-static to this dir, as docker won't touch anything outside of its context.

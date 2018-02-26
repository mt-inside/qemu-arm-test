FROM resin/armv7hf-debian

COPY qemu-arm-static /usr/bin/qemu-arm

RUN [ "/usr/bin/qemu-arm", "/bin/echo", "Hello from ARM container" ]  

ENTRYPOINT [ "/usr/bin/qemu-arm" ]

FROM ubuntu:18.04 AS qemu

RUN apt update && apt install -y build-essential git python pkg-config zlib1g-dev libglib2.0-dev libpixman-1-dev libfdt-dev
RUN git clone git://git.qemu.org/qemu.git
WORKDIR /qemu
RUN apt install -y 
RUN ./configure --target-list=arm-linux-user --static
RUN make -j9

FROM resin/armv7hf-debian
COPY --from=qemu /qemu/arm-linux-user/qemu-arm /usr/bin/qemu-arm

# Rather than doing this, can register the ELF format with binfmt_misc.
# See especially the F flag
RUN [ "/usr/bin/qemu-arm", "/bin/echo", "Hello from ARM container" ]  
ENTRYPOINT [ "/usr/bin/qemu-arm" ]

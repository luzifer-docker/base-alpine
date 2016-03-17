FROM alpine:3.3

##
## ROOTFS
##

# root filesystem
COPY rootfs /

# s6 overlay
RUN apk-install wget \
 && wget https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz --no-check-certificate -O /tmp/s6-overlay.tar.gz \
 && tar xvfz /tmp/s6-overlay.tar.gz -C / \
 && rm -f /tmp/s6-overlay.tar.gz \
 && apk del wget

##
## INIT
##

ENTRYPOINT [ "/init" ]

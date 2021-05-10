FROM alpine:3.13.5
ENV VERSION="v0.17.2.0"
ENV SHA="b5986d6dfbddee14e32b28305dd0dc6352c18b632f569227f2c7265ef7dc5081"
RUN apk update && \
  apk add curl && \
  curl -o monero https://downloads.getmonero.org/cli/monero-linux-armv7-$VERSION.tar.bz2 && \ 
  sha256sum ./monero | grep -e $SHA && \
  apk del curl sed && \
  chmod +x ./monero && \
  cp monero /usr/bin/monero
CMD ["monero"]

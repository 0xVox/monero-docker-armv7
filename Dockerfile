FROM debian:stable-slim
ENV VERSION="v0.17.2.0"
ENV SHA="b5986d6dfbddee14e32b28305dd0dc6352c18b632f569227f2c7265ef7dc5081"
RUN apt update && \
  apt install -y bzip2 curl tar && \
  curl -o monero.tar.bz2 https://downloads.getmonero.org/cli/monero-linux-armv7-$VERSION.tar.bz2 && \ 
  sha256sum ./monero.tar.bz2 | grep -e $SHA && \
  tar -xvf ./monero.tar.bz2 && \
  apt remove curl sed -y --allow-remove-essential && \
  cp ./**/monerod /usr/bin/ && \
  rm -rf monero* && \
  chmod +x /usr/bin/monerod 
CMD ["monerod"]

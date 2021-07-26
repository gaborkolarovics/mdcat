FROM alpine:latest

LABEL maintainer="gabor.kolarovics@gmail.com"
LABEL description="mdcat : https://github.com/lunaryorn/mdcat \
Usage: docker run -v `pwd`:/docs gaborkolarovics/mdcat README.md"

ADD mdcat-0.23.1-x86_64-unknown-linux-musl.tar.gz /tmp

RUN mv /tmp/mdcat-0.23.1-x86_64-unknown-linux-musl/mdcat /bin/mdcat

WORKDIR /docs

ENTRYPOINT [ "mdcat" ]

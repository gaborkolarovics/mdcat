FROM alpine:latest

LABEL maintainer="gabor.kolarovics@gmail.com"
LABEL description="mdcat : https://github.com/lunaryorn/mdcat \
Usage: docker run -v `pwd`:/docs gaborkolarovics/mdcat README.md"

ARG FILENAME
ADD $FILENAME.tar.gz /tmp

RUN mv /tmp/$FILENAME/mdcat /bin/mdcat

WORKDIR /docs

ENTRYPOINT [ "mdcat" ]

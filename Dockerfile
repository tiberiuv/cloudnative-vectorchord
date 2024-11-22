ARG CNPG_TAG

FROM ghcr.io/cloudnative-pg/postgresql:$CNPG_TAG

ARG CNPG_TAG
ARG VECTORCHORD_TAG
ARG TARGETARCH

# drop to root to install packages
USER root
ADD https://github.com/tensorchord/VectorChord/releases/download/$VECTORCHORD_TAG/vchord-pg${CNPG_TAG%.*}_${VECTORCHORD_TAG#"v"}_$TARGETARCH.deb ./vchord.deb
RUN apt install ./vchord.deb

USER postgres


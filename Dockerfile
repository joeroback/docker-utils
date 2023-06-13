FROM debian:bookworm-slim

LABEL org.opencontainers.image.source="https://github.com/joeroback/docker-utils"

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE="true"
ENV DEBIAN_FRONTEND="noninteractive"

ENV TZ="America/Denver"

RUN \
    apt-get update && \
    apt-get install --yes --no-install-recommends \
        apt-utils && \
    apt-get dist-upgrade --yes

RUN \
    apt-get install --yes --no-install-recommends \
        bash \
        bzip2 \
        ca-certificates \
        coreutils \
        curl \
        gnupg \
        iperf3 \
        jq \
        mbw \
        nano \
        neovim \
        nmap \
        openssh-client \
        openssl \
        p7zip-full \
        pbzip2 \
        pigz \
        rsync \
        stress-ng \
        supervisor \
        tzdata \
        unzip \
        util-linux \
        wget \
        zsh \
        zstd

RUN \
    curl -fsS https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash && \
    apt-get install speedtest

RUN \
    apt-get clean && \
    apt-get autoremove --purge --yes && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

EXPOSE 5201/tcp

CMD [ "/usr/bin/sleep", "infinity" ]

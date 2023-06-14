FROM debian:bookworm-slim

LABEL org.opencontainers.image.source="https://github.com/joeroback/docker-utils"

ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE="true"
ARG DEBIAN_FRONTEND="noninteractive"

RUN \
    apt-get update && \
    apt-get install --yes --no-install-recommends \
        locales-all

ARG LC_ALL en_US.UTF-8
ARG LANG en_US.UTF-8
ARG LANGUAGE en_US:en

RUN \
    apt-get install --yes --no-install-recommends \
        apt-utils apt-transport-https software-properties-common && \
    apt-add-repository contrib && \
    apt-add-repository non-free

RUN \
    apt-get update && \
    apt-get dist-upgrade --yes

ARG TZ="Etc/UTC"

RUN \
    apt-get install --yes --no-install-recommends \
        bash \
	binutils \
	bsdutils \
	build-essential \
        bzip2 \
        ca-certificates \
	cmake \
        coreutils \
        curl \
	debianutils \
	diffutils \
	ethtool \
	findutils \
	git \
        gnupg \
	gzip \
	hostname \
        iperf3 \
	iproute2 \
	iputils-arping \
	iputils-clockdiff \
	iputils-ping \
	iputils-tracepath \
        jq \
	lsof \
        mbw \
        nano \
        neovim \
	net-tools \
        nmap \
        openssh-client \
        openssl \
        p7zip-full \
        pbzip2 \
	procps \
        pigz \
        rsync \
        stress-ng \
        supervisor \
	tar \
        tzdata \
	unrar-free \
        unzip \
        util-linux \
	vnstat \
	wireguard-tools \
        wget \
	xz-utils \
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

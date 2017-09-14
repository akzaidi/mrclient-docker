FROM ubuntu:16.04

MAINTAINER Ali Zaidi <alikaz.zaidi@gmail.com>

# create user and group
RUN groupadd -r -g 2200 rstudio && \
    useradd -rM -g rstudio -u 2200 rstudio

# set working dir to tmp
WORKDIR /tmp

# Install R Client
RUN apt-get update -qq \
        && apt-get dist-upgrade -y \
        && apt-get install -y libunwind8 gettext libssl-dev libcurl3-dev zlib1g libicu-dev \
        && apt-get install -y wget \
	&& wget aka.ms/rclientlinux && tar -xvzf rclientlinux  \
        && cd MRC_Linux && chmod +x ./install.sh && ./install.sh -ams \
        && rm -rf /tmp/MRC_Linux \
        && rm -rf /var/lib/apt/lists/*

# install rstudio server
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
        file \
        git \
        libapparmor1 \
        libedit2 \
        libcurl4-openssl-dev \
        libssl-dev \
        lsb-release \
        psmisc \
        python-setuptools \
        sudo \
        gdebi-core \
        wget \
	libssl-dev

RUN wget https://s3.amazonaws.com/rstudio-dailybuilds/rstudio-server-1.1.246-amd64.deb
RUN gdebi -nq rstudio-server-1.1.246-amd64.deb
RUN rm rstudio-server-1.1.246-amd64.deb

# startup scripts
EXPOSE 8787

CMD rstudio-server start


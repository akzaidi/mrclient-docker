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
        && rm -rf /var/lib/apt/lists/* && \
	&& make \
	&& gcc


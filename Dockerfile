FROM ubuntu:16.04

MAINTAINER Ali Zaidi <alikaz.zaidi@gmail.com>

## (Based on https://github.com/rocker-org/rocker/blob/master/r-base/Dockerfile)
## Set a default user. Available via runtime flag `--user docker`
## Add user to 'staff' group, granting them write privileges to /usr/local/lib/R/site.library
## User should also have & own a home directory (e.g. for linked volumes to work properly).
RUN useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& addgroup docker staff

# set working dir to tmp
WORKDIR /tmp

# Install R Client
RUN apt-get update -qq \
        && apt-get dist-upgrade -y \
        && apt-get install -y libunwind8 gettext libssl-dev libcurl3-dev zlib1g libicu-dev \
        && apt-get install -y wget make gcc \
	&& wget aka.ms/rclientlinux && tar -xvzf rclientlinux  \
        && cd MRC_Linux && chmod +x ./install.sh && ./install.sh -ams \
        && rm -rf /tmp/MRC_Linux \
        && rm -rf /var/lib/apt/lists/*

# set work directory to home
WORKDIR /home/docker

# Print EULAs on every start of R to the user, because they were accepted at image build time
COPY EULA.txt MRC_EULA.txt
COPY MKL_EULA.txt MKL_EULA.txt
COPY MRO_EULA.txt MRO_EULA.txt

# copy demo script
COPY demo.R demo.R

LABEL org.label-schema.license="https://mran.microsoft.com/faq/#licensing" \
    org.label-schema.vendor="Microsoft Corporation, Dockerfile provided by Ali Zaidi" \
	org.label-schema.name="Microsoft R Client" \
	org.label-schema.description="Docker images of Microsoft R Client (R Client) with the Intel® Math Kernel Libraries (MKL)." \ 
	org.label-schema.vcs-url=$VCS_URL \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.schema-version="rc1" \
	maintainer="Daniel Nüst <alizaidi@microsoft.com>"

CMD ["/usr/bin/R"]




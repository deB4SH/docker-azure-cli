FROM docker.io/library/debian:12.8-slim
#add essentials
RUN apt-get update \
    && apt-get install -y bash apt-transport-https ca-certificates curl gnupg lsb-release
# install with one command
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
# cleanup
RUN rm -rf /var/lib/apt/lists/* \
    && mkdir /site
#set entry
ENTRYPOINT ["az"]
CMD ["--help"]
FROM docker.io/library/debian:12.8-slim
#add essentials
RUN apt update \
    && apt install -y bash apt-transport-https ca-certificates curl gnupg lsb-release gpg wget
# install with one command
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
# install terraform
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
    && apt update \
    && apt install -y terraform
# cleanup
RUN rm -rf /var/lib/apt/lists/* \
    && mkdir /site
#set entry
ENTRYPOINT ["az"]
CMD ["--help"]
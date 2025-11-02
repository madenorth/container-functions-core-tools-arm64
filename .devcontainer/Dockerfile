FROM mcr.microsoft.com/devcontainers/dotnet:1-9.0-bookworm

# ARG VARIANT="6.0-focal"
# FROM mcr.microsoft.com/devcontainers/dotnet:0-${VARIANT}

# Add .NET global tools path
ENV PATH $PATH:/home/vscode/.dotnet:/home/vscode/.dotnet/tools

# [Choice] Node.js version: none, lts/*, 18, 16, 14
ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
#     && sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
#     && apt-get update \
#     && sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/debian/$(lsb_release -rs | cut -d'.' -f 1)/prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list' \
#     && sudo apt-get update \
#     && apt-get -y install azure-functions-core-tools-4


RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
    && sudo apt-get clean \
    && apt-get update \
    && sudo sh -c 'echo "deb [arch=arm64] https://packages.microsoft.com/debian/$(lsb_release -rs | cut -d'.' -f 1)/prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list' \
    && sudo apt-get update \
    && sudo apt-get -y install azure-functions-core-tools-4

# RUN sudo apt-get update \
#     && apt-get install -y --no-install-suggests --no-install-recommends \
#     ca-certificates \
#     gpg \
#     wget \
# && sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /usr/share/keyrings/microsoft-prod.gpg \
# && sudo wget -q https://packages.microsoft.com/config/debian/bookworm/prod.list \
# && sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list \
# && sudo chown root:root /usr/share/keyrings/microsoft-prod.gpg \
# && sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list \
# && sudo apt-get update \
# && sudo apt-get install azure-functions-core-tools-4 -y

# see https://github.com/Azure/azure-functions-core-tools/issues/4279 
# for issues relating to the above
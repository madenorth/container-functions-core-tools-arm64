FROM mcr.microsoft.com/devcontainers/dotnet:1-8.0-bookworm

ENV PATH $PATH:/home/vscode/.dotnet:/home/vscode/.dotnet/tools

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
    && sudo apt-get clean \
    && apt-get update \
    && sudo sh -c 'echo "deb [arch=arm64] https://packages.microsoft.com/debian/$(lsb_release -rs | cut -d'.' -f 1)/prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list' \
    && sudo apt-get update \
    && sudo apt-get -y install azure-functions-core-tools-4 \
    \
    # Add Azure CLI repo and install azure-cli
    && sudo sh -c 'echo "deb [arch=arm64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/azure-cli.list' \
    && sudo apt-get update \
    && sudo apt-get -y install azure-cli
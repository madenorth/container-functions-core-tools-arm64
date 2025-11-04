#!/bin/bash
# filepath: /workspaces/azure-functions-csharp-devcontainer/.devcontainer/azurite-start.sh

set -e

# Azurite configuration
ACCOUNT_NAME="devstoreaccount1"
ACCOUNT_KEY="Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw=="
# include the account path here
BLOB_ENDPOINT="http://127.0.0.1:10000/devstoreaccount1"

# Build a connection string Az CLI will accept
export AZURE_STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=http;AccountName=${ACCOUNT_NAME};AccountKey=${ACCOUNT_KEY};BlobEndpoint=${BLOB_ENDPOINT};"

# Wait for Azurite to be ready
echo "Waiting for Azurite to be ready..."
for i in {1..30}; do
    if curl -s "${BLOB_ENDPOINT}?restype=account&comp=properties" > /dev/null 2>&1; then
        echo "✓ Azurite is ready!"
        break
    fi
    echo "  Attempt $i/30: Azurite not ready yet..."
    sleep 2
done

# Container names to create
CONTAINERS=(
    "samples-workitems"
)

echo ""
echo "Creating storage containers in Azurite..."
echo "Blob endpoint: $BLOB_ENDPOINT"
echo ""

for CONTAINER in "${CONTAINERS[@]}"; do
    echo "Creating container: $CONTAINER"
    
    az storage container create \
        --name "$CONTAINER" \
        --connection-string "$AZURE_STORAGE_CONNECTION_STRING" \
        --only-show-errors \
        --output table
    
    if [ $? -eq 0 ]; then
        echo "✓ Container '$CONTAINER' created successfully"
    else
        echo "✗ Failed to create container '$CONTAINER'"
    fi
    echo ""
done

echo "All containers processed!"
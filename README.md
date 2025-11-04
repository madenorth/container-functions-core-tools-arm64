# Azure Functions Core Tools (C#) Arm64 Container

This project provides a dev container config for running and debugging Azure Functions v4 locally using C# on Arm64. It has been tested on a Mac M1 Pro.

## Getting Started

To get started with this project, follow these steps:

1. **Clone the Repository**: Clone this repository to your local machine.
2. **Open in VS Code**: Open the project folder in Visual Studio Code.
3. **Reopen in Container**: Use the command palette (Ctrl+Shift+P) and select "Remote-Containers: Reopen in Container" to build and start the development container.
4. **Run the Function**: Once the container is running, you can start debugging or running your Azure Functions locally by running the command `func start` from inside the src directory
5. **Test the Function**: Once the functions are running locally, you can test it is working by opening a web browser at `http://localhost:7071/api/HttpTrigger`. This should show you the welcome message: **Welcome to Azure Functions!**

## Issues
- At present (October 2025), it doesn't work with .NET 9.

## Using HTTPS

The following commands need running as the user in the container
```sh
dotnet tool update -g linux-dev-certs
dotnet linux-dev-certs install
```

Change `host start` in tasks.json to `host start --useHttps --useDefaultCert`

## Resources
- [Functions Core Tools Github Repository](https://github.com/Azure/azure-functions-core-tools)
- [Github issue log for enabling Arm64 Core Tools](https://github.com/Azure/azure-functions-core-tools/issues/4279)
- [VS Code Dev Container Documentation](https://code.visualstudio.com/docs/devcontainers/create-dev-container)

## Using Azurite (local Storage emulator)

This devcontainer runs Azurite (the Azure Storage emulator) as a separate Docker container via docker-compose so your Functions can use a local storage endpoint.

What was added:
- A `docker-compose.yml` file that defines both the devcontainer and Azurite services.
- The Azurite container runs the official Microsoft Azure Storage Azurite image.
- Ports 10000 (Blob), 10001 (Queue), 10002 (Table), and 7071 (Functions) are exposed.
- Data is persisted in the `./azurite/data` directory.

How to use:

1. Reopen the repository in the dev container (Command Palette -> Remote-Containers: Reopen in Container). Docker Compose will start both the devcontainer and Azurite.
2. Azurite starts automatically with the containers. You can also start/stop/restart it manually using the VS Code Tasks: `Start Azurite` / `Stop Azurite` / `Restart Azurite`.
3. The Functions app already uses `UseDevelopmentStorage=true` in `src/local.settings.json`, so the Functions runtime will connect to Azurite at the default local endpoints (http://127.0.0.1:10000 etc.).

Verify:

- Azurite should be running automatically when the dev container starts.
- Start the Functions host (run the `run` task or `func start` in the `src` folder).
- Your function should connect to the local storage emulator for triggers/bindings that require storage.

Notes:

- Data is persisted in `./azurite/data` and will survive container restarts.
- The devcontainer shares the network with Azurite for seamless connectivity.
- Both services are defined in `.devcontainer/docker-compose.yml`.
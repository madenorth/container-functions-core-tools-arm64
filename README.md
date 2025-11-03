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

## Resources
- [Functions Core Tools Github Repository](https://github.com/Azure/azure-functions-core-tools)
- [Github issue log for enabling Arm64 Core Tools](https://github.com/Azure/azure-functions-core-tools/issues/4279)
- [VS Code Dev Container Documentation](https://code.visualstudio.com/docs/devcontainers/create-dev-container)